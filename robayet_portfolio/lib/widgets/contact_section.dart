import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/portfolio_data.dart';
import '../services/form_submission_service.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';
import 'social_links.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String get _subject => _subjectController.text.trim().isEmpty
      ? 'Portfolio inquiry'
      : _subjectController.text.trim();

  Future<void> _sendEmail() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _sending = true);
    try {
      await FormSubmissionService.send(
        fromName: _nameController.text.trim(),
        fromEmail: _emailController.text.trim(),
        subject: _subject,
        message: _messageController.text.trim(),
      );
      if (!mounted) return;
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Message submitted. If this is your first use, confirm the '
            'FormSubmit activation email; pending messages will then be forwarded.',
          ),
        ),
      );
    } on FormSubmissionException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not send your email. Please try again later.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _copy(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  String? _required(String? value, String label) =>
      value == null || value.trim().isEmpty ? '$label is required' : null;

  String? _validateEmail(String? value) {
    final required = _required(value, 'Email');
    if (required != null) return required;
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value!.trim())
        ? null
        : 'Enter a valid email address';
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Get In Touch',
      eyebrow: 'START A CONVERSATION',
      subtitle:
          "Have a project in mind, hiring opportunity, or technical question? I'm readily available to connect.",
      child: LayoutBuilder(
        builder: (context, constraints) {
          final stacked = constraints.maxWidth < 850;
          final contactPanel = _buildContactPanel();
          final messagePanel = _buildMessagePanel();
          if (stacked) {
            return Column(
              children: [
                contactPanel,
                const SizedBox(height: 20),
                messagePanel,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: contactPanel),
              const SizedBox(width: 24),
              Expanded(flex: 3, child: messagePanel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContactPanel() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's discuss your vision",
              style: TextStyle(
                color: AppColors.text,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Building a web platform, mobile app, or software project? Let's build it together.",
              style: TextStyle(
                color: AppColors.muted,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 22),
            _ContactInfoCard(
              label: 'EMAIL ADDRESS',
              value: email,
              icon: Icons.mail_rounded,
              color: AppColors.violet,
              onTap: () => openLink('mailto:$email'),
              onCopy: () => _copy(email),
            ),
            const SizedBox(height: 14),
            _ContactInfoCard(
              label: 'PHONE NUMBER',
              value: phoneNumber,
              icon: Icons.phone_rounded,
              color: const Color(0xFF5598FF),
              onTap: () => openLink(phoneUrl),
              onCopy: () => _copy(phoneNumber),
            ),
            const SizedBox(height: 14),
            _ContactInfoCard(
              label: 'LOCATION',
              value: contactLocation,
              icon: Icons.location_on_rounded,
              color: AppColors.pink,
              onTap: () => openLink(
                'https://www.google.com/maps/search/?api=1&query='
                '${Uri.encodeComponent(contactLocation)}',
              ),
              trailingIcon: Icons.open_in_new_rounded,
            ),
          ],
        ),
      );

  Widget _buildMessagePanel() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Send a message',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final stacked = constraints.maxWidth < 500;
                  final nameField = _labeledField(
                    label: 'YOUR NAME *',
                    child: TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => _required(value, 'Name'),
                      decoration: _inputDecoration('e.g. John Doe'),
                    ),
                  );
                  final emailField = _labeledField(
                    label: 'YOUR EMAIL *',
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                      decoration: _inputDecoration('you@example.com'),
                    ),
                  );
                  if (stacked) {
                    return Column(
                      children: [
                        nameField,
                        const SizedBox(height: 16),
                        emailField,
                      ],
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: nameField),
                      const SizedBox(width: 16),
                      Expanded(child: emailField),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              _labeledField(
                label: 'SUBJECT',
                child: TextFormField(
                  controller: _subjectController,
                  decoration: _inputDecoration('e.g. Project inquiry'),
                ),
              ),
              const SizedBox(height: 16),
              _labeledField(
                label: 'MESSAGE *',
                child: TextFormField(
                  controller: _messageController,
                  minLines: 4,
                  maxLines: 5,
                  validator: (value) => _required(value, 'Message'),
                  decoration: _inputDecoration(
                    'Describe your project, timeline, or inquiry...',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _sending ? null : _sendEmail,
                  icon: _sending
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.mail_rounded),
                  label: Text(_sending ? 'Sending...' : 'Send via Email'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.violet,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _labeledField({required String label, required Widget child}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF73768D), fontSize: 14),
        filled: true,
        fillColor: AppColors.surface2,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.pink),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.pink, width: 1.4),
        ),
      );
}

class _ContactInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? onCopy;
  final IconData? trailingIcon;

  const _ContactInfoCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.onTap,
    this.onCopy,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: Container(
            constraints: const BoxConstraints(minHeight: 78),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 21),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onCopy != null)
                  IconButton(
                    tooltip: 'Copy $label',
                    onPressed: onCopy,
                    icon: const Icon(Icons.content_copy_rounded, size: 18),
                    color: AppColors.muted,
                    visualDensity: VisualDensity.compact,
                  )
                else if (trailingIcon != null)
                  Icon(trailingIcon, color: AppColors.muted, size: 18),
              ],
            ),
          ),
        ),
      );
}
