part of '../projects_section.dart';

class _ProjectsHeading extends StatelessWidget {
  final bool mobile;

  const _ProjectsHeading({required this.mobile});

  @override
  Widget build(BuildContext context) {
    final size = mobile ? 30.0 : 38.0;
    final baseStyle = TextStyle(
      color: AppColors.text,
      fontSize: size,
      fontWeight: FontWeight.w900,
      letterSpacing: -1.1,
      height: 1.15,
    );
    return Text.rich(
      TextSpan(
        style: baseStyle,
        children: const [
          TextSpan(text: 'Featured Projects & '),
          TextSpan(
            text: 'Case Studies',
            style: TextStyle(
              color: AppColors.accent,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.accent,
              decorationThickness: 1.5,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
