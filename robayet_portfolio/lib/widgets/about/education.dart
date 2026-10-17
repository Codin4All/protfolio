part of '../about_section.dart';

const _educationEntries = [
  _EducationEntry(
    title: 'B.Sc. in Computer Science & Engineering',
    period: '2022 - Present',
    institution: 'Bangladesh University of Business and Technology (BUBT)',
    description:
        'Focusing on Software Engineering, Data Structures, Algorithms, '
        'Database Management, and Distributed Systems.',
    highlights: [
      'Active participant in coding hackathons and technical community events.',
      'Core coursework in Object-Oriented Programming, System Design, and Web Architectures.',
    ],
  ),
  _EducationEntry(
    title: 'Higher Secondary Certificate (HSC)',
    period: '2019 - 2021',
    institution: 'Farakkabad Degree College',
    description:
        'Completed higher secondary education in the Science stream with '
        'distinction in Mathematics, Physics, and ICT.',
    highlights: ['Graduated with excellent GPA in Science division.'],
  ),
];

class _EducationEntry {
  final String title;
  final String period;
  final String institution;
  final String description;
  final List<String> highlights;

  const _EducationEntry({
    required this.title,
    required this.period,
    required this.institution,
    required this.description,
    required this.highlights,
  });
}

class _EducationHeading extends StatelessWidget {
  const _EducationHeading();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'ACADEMIC BACKGROUND',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.6,
            ),
          ),
          const SizedBox(height: 8),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: AppColors.accentGradient.createShader,
            child: const Text(
              'Education',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
              ),
            ),
          ),
        ],
      );
}

class _EducationCard extends StatelessWidget {
  final _EducationEntry entry;
  const _EducationCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 600;
    return AppCard(
      padding: EdgeInsets.all(mobile ? 18 : 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 12,
            spacing: 14,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width < 900
                      ? MediaQuery.sizeOf(context).width - 100
                      : 760,
                ),
                child: Text(
                  entry.title,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: mobile ? 18 : 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.calendar_month_rounded,
                        color: AppColors.accent, size: 14),
                    const SizedBox(width: 7),
                    Text(
                      entry.period,
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            entry.institution,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            entry.description,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 17),
          Divider(color: AppColors.border.withValues(alpha: 0.7), height: 1),
          const SizedBox(height: 13),
          for (final highlight in entry.highlights)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Icon(Icons.workspace_premium_rounded,
                        color: AppColors.violet, size: 15),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      highlight,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
