part of '../certificates_section.dart';

Future<void> _showCredentialDetails(
  BuildContext context,
  CertificateModel certificate,
) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.border),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Credential Details',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () => Navigator.pop(dialogContext),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                certificate.title,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),
              _CredentialDetailRow(label: 'Issuer', value: certificate.issuer),
              const SizedBox(height: 12),
              _CredentialDetailRow(label: 'Year', value: certificate.year),
              const SizedBox(height: 12),
              _CredentialDetailRow(
                label: 'Type',
                value: certificate.category,
              ),
              if (certificate.credentialId.isNotEmpty) ...[
                const SizedBox(height: 12),
                _CredentialDetailRow(
                  label: 'Credential ID',
                  value: certificate.credentialId,
                ),
              ],
              const SizedBox(height: 20),
              Text(
                certificate.description.isEmpty
                    ? 'No additional description has been added for this credential yet.'
                    : certificate.description,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 14,
                  height: 1.65,
                ),
              ),
              if (certificate.image.isNotEmpty) ...[
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    certificate.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: AppColors.surface2,
                      child: const Text(
                        'Certificate preview unavailable.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.muted),
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 10,
                children: [
                  if (certificate.fileUrl.isNotEmpty)
                    OutlinedButton.icon(
                      onPressed: () => openLink(certificate.fileUrl),
                      icon: const Icon(Icons.open_in_new_rounded, size: 17),
                      label: const Text('Open Certificate'),
                    ),
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _CredentialDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _CredentialDetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 112,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );
}
