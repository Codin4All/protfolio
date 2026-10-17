part of '../about_section.dart';

class AboutSection extends StatelessWidget {
  final VoidCallback onContact;
  const AboutSection({super.key, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      _MetricData(projects.length.toString().padLeft(2, '0'), 'Projects'),
      _MetricData(
          skillGroups.length.toString().padLeft(2, '0'), 'Skill groups'),
      _MetricData(skills.length.toString().padLeft(2, '0'), 'Skill cards'),
      const _MetricData('CSE', 'Academic field'),
    ];

    return SectionWrapper(
      title: 'About Me',
      eyebrow: 'GET TO KNOW ME',
      background: AppColors.bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            final wide = constraints.maxWidth >= 900;
            final profile = _ProfileDetails(
              metrics: metrics,
              onContact: onContact,
            );
            return wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(flex: 5, child: _PortraitFrame()),
                      const SizedBox(width: 72),
                      Expanded(flex: 7, child: profile),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _PortraitFrame(),
                      const SizedBox(height: 38),
                      profile,
                    ],
                  );
          }),
          const SizedBox(height: 68),
          const SectionReveal(child: _EducationHeading()),
          const SizedBox(height: 27),
          for (var index = 0; index < _educationEntries.length; index++) ...[
            SectionReveal(
              child: _EducationCard(entry: _educationEntries[index]),
            ),
            if (index != _educationEntries.length - 1)
              const SizedBox(height: 22),
          ],
        ],
      ),
    );
  }
}
