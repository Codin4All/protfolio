part of '../contact_section.dart';

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
}
