part of '../about_section.dart';

class _PortraitFrame extends StatefulWidget {
  const _PortraitFrame();

  @override
  State<_PortraitFrame> createState() => _PortraitFrameState();
}

class _PortraitFrameState extends State<_PortraitFrame> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AspectRatio(
        aspectRatio: 0.96,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.violet.withValues(alpha: 0.11),
                blurRadius: 36,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedScale(
                  scale: _hovered ? 1.035 : 1,
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,
                  child: Image.asset(
                    profileImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    semanticLabel: 'Portrait of $ownerName',
                  ),
                ),
                Positioned(
                  right: 14,
                  bottom: 14,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
                    decoration: BoxDecoration(
                      color: AppColors.bg.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flutter_dash,
                            color: AppColors.accent, size: 17),
                        SizedBox(width: 7),
                        Text('Flutter • Dart',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
