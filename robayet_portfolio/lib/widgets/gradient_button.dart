import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final double height;

  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = 54,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.035 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color:
                    AppColors.violet.withValues(alpha: _hovered ? 0.32 : 0.2),
                blurRadius: _hovered ? 30 : 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: widget.onPressed,
              child: SizedBox(
                height: widget.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (widget.icon != null) ...[
                        const SizedBox(width: 10),
                        Icon(widget.icon, size: 18, color: Colors.white),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
