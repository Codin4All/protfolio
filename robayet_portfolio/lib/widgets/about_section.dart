import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'gradient_button.dart';
import 'section_wrapper.dart';
import 'social_links.dart';

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

const _educationEntries = [
  _EducationEntry(
    title: 'B.Sc. in Computer Science & Engineering',
    period: '2022 - Present',
    institution:
        'Bangladesh University of Business and Technology (BUBT)',
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

class _ProfileDetails extends StatelessWidget {
  final List<_MetricData> metrics;
  final VoidCallback onContact;

  const _ProfileDetails({required this.metrics, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 9,
          children: [
            Text(
              "Hi, I'm",
              style: TextStyle(
                color: AppColors.text,
                fontSize: mobile ? 28 : 34,
                fontWeight: FontWeight.w800,
              ),
            ),
            _GradientText(
              ownerName,
              style: TextStyle(
                fontSize: mobile ? 28 : 34,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        Text(
          '$ownerTitle | $ownerSubtitle',
          style: const TextStyle(
            color: AppColors.accent,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 17),
        Text(
          aboutText,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 25),
        LayoutBuilder(builder: (context, constraints) {
          const gap = 12.0;
          final columns = constraints.maxWidth >= 740 ? 4 : 2;
          final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: [
              for (final metric in metrics)
                SizedBox(
                  width: width,
                  child: SectionReveal(
                    child: _AboutMetric(metric: metric),
                  ),
                ),
            ],
          );
        }),
        const SizedBox(height: 25),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GradientButton(
              label: 'Contact Me',
              icon: Icons.mail_outline_rounded,
              onPressed: onContact,
            ),
            if (cvUrl.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => openLink(cvUrl),
                icon: const Icon(Icons.download_rounded, size: 18),
                label: const Text('Download Resume'),
              ),
          ],
        ),
      ],
    );
  }
}

class _PortraitFrame extends StatefulWidget {
  const _PortraitFrame();

  @override
  State<_PortraitFrame> createState() => _PortraitFrameState();
}

class _PortraitFrameState extends State<_PortraitFrame> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AspectRatio(
        aspectRatio: 0.96,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.violet.withValues(alpha: 0.11),
                blurRadius: 36,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedScale(
                  scale: _hovered ? 1.035 : 1,
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,
                  child: Image.asset(
                    profileImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    semanticLabel: 'Portrait of $ownerName',
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                    decoration: BoxDecoration(
                      color: AppColors.bg.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flutter_dash,
                            color: AppColors.accent, size: 17),
                        SizedBox(width: 7),
                        Text('Flutter • Dart',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutMetric extends StatelessWidget {
  final _MetricData metric;
  const _AboutMetric({required this.metric});

  @override
  Widget build(BuildContext context) {
    final target = int.tryParse(metric.value);
    return Container(
      constraints: const BoxConstraints(minHeight: 86),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (target == null)
            _MetricValue(metric.value)
          else
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: target),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) =>
                  _MetricValue(value.toString().padLeft(2, '0')),
            ),
          const SizedBox(height: 6),
          Text(
            metric.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _MetricValue extends StatelessWidget {
  final String value;
  const _MetricValue(this.value);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: AppColors.accentGradient.createShader,
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const _GradientText(this.text, {required this.style});

  @override
  Widget build(BuildContext context) => ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: AppColors.accentGradient.createShader,
        child: Text(text, style: style.copyWith(color: Colors.white)),
      );
}

class _MetricData {
  final String value;
  final String label;
  const _MetricData(this.value, this.label);
}
