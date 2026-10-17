part of '../contact_section.dart';

extension _ContactMessageFormBuilder on _ContactSectionState {
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
