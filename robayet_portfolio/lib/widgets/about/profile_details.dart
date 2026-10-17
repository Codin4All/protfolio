part of '../about_section.dart';

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
