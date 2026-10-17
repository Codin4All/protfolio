part of '../section_wrapper.dart';

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
