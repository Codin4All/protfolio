part of '../project_details_screen.dart';

class _ForegroundMessageCard extends StatelessWidget {
  const _ForegroundMessageCard();

  @override
  Widget build(BuildContext context) => Container(
        width: 174,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: const Color(0xFF141B2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.27)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 29,
              height: 29,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(Icons.task_alt_rounded,
                  color: AppColors.accent, size: 16),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Task',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Complete Flutter Assignment',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 7,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
