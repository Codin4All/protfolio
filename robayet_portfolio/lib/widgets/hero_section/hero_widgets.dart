part of '../hero_section.dart';

class _GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const _GradientText(this.text, {required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppColors.accentGradient.createShader(bounds),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  const _TechTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.025),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label,
          style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w600)),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: AppColors.success.withValues(alpha: 0.5), blurRadius: 9),
          ],
        ),
      );
}
