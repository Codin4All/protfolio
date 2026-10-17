part of '../certificates_section.dart';

class _CertificateCard extends StatefulWidget {
  final CertificateModel certificate;

  const _CertificateCard({required this.certificate});

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final certificate = widget.certificate;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.violet.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 10,
              children: [
                _CategoryBadge(label: certificate.category),
                Text(
                  certificate.year,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              certificate.title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 19,
                fontWeight: FontWeight.w800,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              certificate.issuer,
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              certificate.description.isEmpty
                  ? 'Open the credential record to view its available details.'
                  : certificate.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 18),
            Divider(color: AppColors.border.withValues(alpha: 0.75), height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  certificate.credentialId.isEmpty
                      ? Icons.info_outline_rounded
                      : Icons.badge_outlined,
                  color: certificate.credentialId.isEmpty
                      ? AppColors.muted
                      : AppColors.accent,
                  size: 15,
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    certificate.credentialId.isEmpty
                        ? 'Credential details'
                        : 'ID: ${certificate.credentialId}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: certificate.credentialId.isEmpty
                          ? AppColors.muted
                          : AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _showCredentialDetails(context, certificate),
                  icon: const Icon(Icons.visibility_outlined, size: 16),
                  label: const Text('View Credentials'),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        _hovered ? AppColors.accent : AppColors.text,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
