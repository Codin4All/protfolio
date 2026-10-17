part of '../hero_section.dart';

class _HeroText extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final bool wide;

  const _HeroText({
    required this.onProjects,
    required this.onContact,
    required this.wide,
  });

  @override
  Widget build(BuildContext context) {
    final titleSize = wide ? 64.0 : 44.0;
    final leadSize = wide ? 30.0 : 25.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.035),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.border),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 11,
            runSpacing: 8,
            children: [
              const Text('Hello there',
                  style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w700,
                      fontSize: 13)),
              Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                      color: AppColors.muted, shape: BoxShape.circle)),
              const _StatusDot(),
              Text(
                availabilityBadge.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const Icon(Icons.auto_awesome, size: 15, color: AppColors.violet),
            ],
          ),
        ),
        const SizedBox(height: 31),
        const Text(
          '<HELLO WORLD, I AM />',
          style: TextStyle(
            color: AppColors.accent,
            fontFamily: 'monospace',
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ownerName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.text,
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 1.06,
            letterSpacing: wide ? -2.3 : -1.3,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('I build ',
                style: TextStyle(
                    color: AppColors.muted,
                    fontSize: leadSize,
                    fontWeight: FontWeight.w500)),
            _GradientText(
              'Flutter apps',
              style: TextStyle(
                fontSize: leadSize,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          heroIntro,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 16,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '$ownerSubtitle  •  ${aboutCards.firstWhere((item) => item[0] == 'Location')[1]}',
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(spacing: 13, runSpacing: 12, children: [
          GradientButton(
            label: 'Explore Featured Work',
            icon: Icons.arrow_downward_rounded,
            onPressed: onProjects,
          ),
          OutlinedButton.icon(
            onPressed: onContact,
            icon: const Icon(Icons.rocket_launch_rounded, size: 17),
            label: const Text('Hire Me'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.text,
              side: const BorderSide(color: AppColors.border),
              minimumSize: const Size(48, 54),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              shape: const StadiumBorder(),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ]),
        const SizedBox(height: 27),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 13,
          runSpacing: 14,
          children: [
            const Text('NETWORK',
                style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.7)),
            const SocialLinks(),
            Container(width: 1, height: 30, color: AppColors.border),
            for (final skill in const ['Flutter', 'Dart', 'Firebase'])
              _TechTag(skill),
          ],
        ),
      ],
    );
  }
}
