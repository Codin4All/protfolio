import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ScrollRevealScope extends InheritedWidget {
  final ScrollController controller;

  const ScrollRevealScope({
    super.key,
    required this.controller,
    required super.child,
  });

  static ScrollController? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<ScrollRevealScope>()
      ?.controller;

  @override
  bool updateShouldNotify(ScrollRevealScope oldWidget) =>
      controller != oldWidget.controller;
}

/// Fades and lifts a section when it first enters the viewport.
class SectionReveal extends StatefulWidget {
  final Widget child;
  const SectionReveal({super.key, required this.child});

  @override
  State<SectionReveal> createState() => _SectionRevealState();
}

class _SectionRevealState extends State<SectionReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;
  ScrollController? _scrollController;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 720),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextController = ScrollRevealScope.maybeOf(context);
    if (identical(nextController, _scrollController)) return;

    _scrollController?.removeListener(_checkVisibility);
    _scrollController = nextController;
    if (_scrollController == null) {
      _reveal();
      return;
    }

    _scrollController!.addListener(_checkVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  void _checkVisibility() {
    if (_revealed || !mounted) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;

    final top = renderObject.localToGlobal(Offset.zero).dy;
    final bottom = top + renderObject.size.height;
    final screenHeight = MediaQuery.sizeOf(context).height;
    if (top < screenHeight * 0.92 && bottom > 84) _reveal();
  }

  void _reveal() {
    if (_revealed || !mounted) return;
    _revealed = true;
    _scrollController?.removeListener(_checkVisibility);
    _animation.forward();
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_checkVisibility);
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curve =
        CurvedAnimation(parent: _animation, curve: Curves.easeOutCubic);
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.055),
          end: Offset.zero,
        ).animate(curve),
        child: widget.child,
      ),
    );
  }
}

/// Shared section layout, heading treatment and subtle grid backdrop.
class SectionWrapper extends StatelessWidget {
  final String title;
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

class _SectionHeading extends StatelessWidget {
  final String title;
  final String eyebrow;
  final String? subtitle;
  final bool mobile;
  final bool eyebrowPill;
  final bool showHeadingAccent;
  final bool gradientTitle;

  const _SectionHeading({
    required this.title,
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
        if (gradientTitle)
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

class _GridPainter extends CustomPainter {
  const _GridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.2)
      ..strokeWidth = 0.7;
    const spacing = 80.0;
    for (var x = 0.0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => false;
}

/// Shared card surface with a small lift and accent on pointer hover.
class AppCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(22),
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.62)
                  : AppColors.border),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.violet.withValues(alpha: 0.1),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ]
              : const [],
        ),
        child: widget.child,
      ),
    );
  }
}
