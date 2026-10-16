import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/certificate_model.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';
import 'social_links.dart';

class CertificatesSection extends StatefulWidget {
  const CertificatesSection({super.key});

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

enum _CredentialFilter { all, professional, awards }

class _CertificatesSectionState extends State<CertificatesSection> {
  _CredentialFilter _selectedFilter = _CredentialFilter.all;

  List<CertificateModel> get _visibleCertificates => switch (_selectedFilter) {
        _CredentialFilter.all => certificates,
        _CredentialFilter.professional => certificates
            .where((certificate) =>
                certificate.category == 'Professional Certificates')
            .toList(),
        _CredentialFilter.awards => certificates
            .where((certificate) =>
                certificate.category == 'Awards & Conferences')
            .toList(),
      };

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Certificates & Credentials',
      eyebrow: 'VALIDATED COMPETENCY',
      subtitle:
          'Professional certificates, achievements, and technical credentials.',
      child: Column(
        children: [
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                _CredentialFilterChip(
                  label: 'All Credentials',
                  selected: _selectedFilter == _CredentialFilter.all,
                  onTap: () => setState(
                      () => _selectedFilter = _CredentialFilter.all),
                ),
                _CredentialFilterChip(
                  label: 'Professional Certificates',
                  selected: _selectedFilter == _CredentialFilter.professional,
                  onTap: () => setState(
                      () => _selectedFilter = _CredentialFilter.professional),
                ),
                _CredentialFilterChip(
                  label: 'Awards & Conferences',
                  selected: _selectedFilter == _CredentialFilter.awards,
                  onTap: () => setState(
                      () => _selectedFilter = _CredentialFilter.awards),
                ),
              ],
            ),
          ),
          const SizedBox(height: 38),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: _visibleCertificates.isEmpty
                ? _EmptyCredentials(
                    key: ValueKey(_selectedFilter),
                    message: _selectedFilter == _CredentialFilter.professional
                        ? 'Professional certificates will appear here once added.'
                        : 'Awards and conference credentials will appear here once added.',
                  )
                : LayoutBuilder(
                    key: ValueKey(_selectedFilter),
                    builder: (context, constraints) {
                      final width = gridItemWidth(
                        constraints.maxWidth,
                        maxCols: 2,
                        minItem: 340,
                        gap: 22,
                      );
                      return Wrap(
                        spacing: 22,
                        runSpacing: 22,
                        children: [
                          for (final certificate in _visibleCertificates)
                            SectionReveal(
                              child: SizedBox(
                                width: width,
                                child:
                                    _CertificateCard(certificate: certificate),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _CredentialFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CredentialFilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
              decoration: BoxDecoration(
                gradient: selected ? AppColors.accentGradient : null,
                color: selected ? null : AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected ? Colors.transparent : AppColors.border,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.violet.withValues(alpha: 0.22),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : const [],
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.muted,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      );
}

class _EmptyCredentials extends StatelessWidget {
  final String message;
  const _EmptyCredentials({super.key, required this.message});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            const Icon(Icons.workspace_premium_outlined,
                color: AppColors.violet, size: 32),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
}

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
                    foregroundColor: _hovered ? AppColors.accent : AppColors.text,
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

class _CategoryBadge extends StatelessWidget {
  final String label;
  const _CategoryBadge({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.violet.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.violet.withValues(alpha: 0.42)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.workspace_premium_rounded,
                color: AppColors.violet, size: 14),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
}

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
