part of '../project_card.dart';

class _TaskFilter extends StatelessWidget {
  final String label;
  final bool selected;

  const _TaskFilter({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.violet.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.045),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? AppColors.violet.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.text : AppColors.muted,
            fontSize: 5.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}

class _TaskRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool checked;

  const _TaskRow({
    required this.title,
    required this.subtitle,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.035),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Icon(
              checked
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              size: 11,
              color: checked ? AppColors.success : AppColors.muted,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: checked ? AppColors.muted : AppColors.text,
                      fontSize: 6.5,
                      fontWeight: FontWeight.w700,
                      decoration: checked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.more_horiz_rounded,
                size: 10, color: Colors.white.withValues(alpha: 0.45)),
          ],
        ),
      );
}
