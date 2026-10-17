part of '../certificates_section.dart';

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
            .where(
                (certificate) => certificate.category == 'Awards & Conferences')
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
                  onTap: () =>
                      setState(() => _selectedFilter = _CredentialFilter.all),
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
