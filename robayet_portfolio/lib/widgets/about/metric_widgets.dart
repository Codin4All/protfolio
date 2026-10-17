part of '../about_section.dart';

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
