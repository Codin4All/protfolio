part of '../skills_section.dart';

class _SkillCategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SkillCategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon {
    if (label == 'All Technologies') return Icons.code_rounded;
    if (label == 'Web Interface') return Icons.web_rounded;
    if (label == 'Mobile Apps') return Icons.phone_android_rounded;
    if (label == 'Backend & APIs') return Icons.api_rounded;
    if (label == 'Databases & ORMs') return Icons.storage_rounded;
    if (label == 'IoT & Embedded') return Icons.memory_rounded;
    return Icons.build_rounded;
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
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              decoration: BoxDecoration(
                gradient: selected ? AppColors.accentGradient : null,
                color: selected ? null : AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected ? Colors.transparent : AppColors.border,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.violet.withValues(alpha: 0.2),
                          blurRadius: 15,
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
                ],
              ),
            ),
          ),
        ),
      );
}
