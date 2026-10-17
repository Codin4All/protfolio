part of '../section_wrapper.dart';

class SectionWrapper extends StatelessWidget {
  final String title;
  final Widget? titleWidget;
  final String? eyebrow;
  final String? subtitle;
  final Widget child;
  final Color? background;
  final bool eyebrowPill;
  final bool showHeadingAccent;
  final bool gradientTitle;
  final Color? ambientGlow;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
    this.titleWidget,
    this.eyebrow,
    this.subtitle,
    this.background,
    this.eyebrowPill = false,
    this.showHeadingAccent = true,
    this.gradientTitle = true,
    this.ambientGlow,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return SectionReveal(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: background ?? AppColors.bg),
        child: Stack(
          children: [
            if (ambientGlow != null)
              Positioned(
                top: -170,
                left: 0,
                right: 0,
                height: 620,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0, -0.1),
                        radius: 1,
                        colors: [
                          ambientGlow!.withValues(alpha: 0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            const Positioned.fill(
              child: IgnorePointer(child: CustomPaint(painter: _GridPainter())),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mobile ? 62 : 88, horizontal: mobile ? 20 : 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SectionHeading(
                        title: title,
                        titleWidget: titleWidget,
                        eyebrow: eyebrow ?? title.toUpperCase(),
                        subtitle: subtitle,
                        mobile: mobile,
                        eyebrowPill: eyebrowPill,
                        showHeadingAccent: showHeadingAccent,
                        gradientTitle: gradientTitle,
                      ),
                      SizedBox(height: mobile ? 34 : 48),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
