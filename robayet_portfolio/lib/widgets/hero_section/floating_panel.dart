part of '../hero_section.dart';

class _FloatingPanel extends StatefulWidget {
  final Widget child;
  const _FloatingPanel({required this.child});

  @override
  State<_FloatingPanel> createState() => _FloatingPanelState();
}

class _FloatingPanelState extends State<_FloatingPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3400),
    )..repeat(reverse: true);
    _offset = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _offset,
        child: widget.child,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, _offset.value),
          child: child,
        ),
      );
}
