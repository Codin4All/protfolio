part of '../project_card.dart';

class _TechTag extends StatelessWidget {
  final String label;
  final bool subtle;

  const _TechTag({required this.label, this.subtle = false});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: subtle
              ? AppColors.surface2
              : AppColors.surface2.withValues(alpha: 0.82),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.78)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: subtle ? AppColors.muted : const Color(0xFFC8C9D7),
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}
