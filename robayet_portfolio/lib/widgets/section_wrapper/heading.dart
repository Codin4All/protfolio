part of '../section_wrapper.dart';

class _SectionHeading extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final String eyebrow;
  final String? subtitle;
  final bool mobile;
  final bool eyebrowPill;
  final bool showHeadingAccent;
  final bool gradientTitle;

  const _SectionHeading({
    required this.title,
    required this.titleWidget,
    required this.eyebrow,
    required this.subtitle,
    required this.mobile,
    required this.eyebrowPill,
    required this.showHeadingAccent,
    required this.gradientTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (eyebrowPill)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.38),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.55),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 9),
                Text(
                  eyebrow,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.45,
                  ),
                ),
              ],
            ),
          )
        else
          Text(
            eyebrow,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.accent,
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.6,
            ),
          ),
        const SizedBox(height: 10),
        if (titleWidget != null)
          titleWidget!
        else if (gradientTitle)
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: AppColors.accentGradient.createShader,
            child: _headingText(),
          )
        else
          _headingText(),
        const SizedBox(height: 13),
        if (showHeadingAccent)
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        if (subtitle != null) ...[
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.muted, fontSize: 15, height: 1.6),
            ),
          ),
        ],
      ],
    );
  }

  Text _headingText() => Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: mobile ? 32 : 42,
          fontWeight: FontWeight.w900,
          letterSpacing: -1,
        ),
      );
}
