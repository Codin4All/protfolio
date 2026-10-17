part of '../projects_section.dart';

class _ProjectFilterChip extends StatelessWidget {
  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  const _ProjectFilterChip({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon {
    switch (label) {
      case 'All Projects':
        return Icons.layers_rounded;
      case 'Featured':
        return Icons.star_rounded;
      case 'Mobile Apps':
        return Icons.phone_android_rounded;
      case 'Firebase':
        return Icons.local_fire_department_rounded;
      case 'Notifications':
        return Icons.notifications_active_rounded;
      default:
        return Icons.dashboard_rounded;
    }
  }

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                gradient: selected ? AppColors.accentGradient : null,
                color:
                    selected ? null : AppColors.surface.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected
                      ? Colors.transparent
                      : AppColors.border.withValues(alpha: 0.9),
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.violet.withValues(alpha: 0.18),
                          blurRadius: 16,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : const [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _icon,
                    size: 14,
                    color: selected ? Colors.white : AppColors.muted,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : AppColors.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: selected
                          ? Colors.white.withValues(alpha: 0.22)
                          : AppColors.surface2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: selected ? Colors.white : AppColors.muted,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
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
