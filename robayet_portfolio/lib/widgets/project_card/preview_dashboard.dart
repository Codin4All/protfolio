part of '../project_card.dart';

class _TaskDashboard extends StatelessWidget {
  final ProjectModel project;

  const _TaskDashboard({required this.project});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(9, 7, 10, 7),
        decoration: BoxDecoration(
          color: const Color(0xFF101726).withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.28),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  project.detailsKind == ProjectDetailsKind.taskManager
                      ? Icons.menu_book_rounded
                      : Icons.local_fire_department_rounded,
                  size: 12,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 4),
                Text(
                  project.detailsKind == ProjectDetailsKind.taskManager
                      ? 'TASK MANAGER'
                      : 'FIREBASE TASKS',
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 6,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.65,
                  ),
                ),
                const Spacer(),
                Icon(Icons.search_rounded,
                    size: 10, color: Colors.white.withValues(alpha: 0.64)),
                const SizedBox(width: 6),
                const Icon(Icons.tune_rounded,
                    size: 10, color: AppColors.muted),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text(
                  'My Tasks',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '4 TOTAL',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                _TaskFilter(label: 'All', selected: true),
                SizedBox(width: 4),
                _TaskFilter(label: 'Pending'),
                SizedBox(width: 4),
                _TaskFilter(label: 'Done'),
              ],
            ),
            const SizedBox(height: 5),
            const Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _TaskRow(
                      title: 'Complete Flutter Assignment',
                      subtitle: 'Due Oct 05 - High priority',
                      checked: false,
                    ),
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    child: _TaskRow(
                      title: 'Review Firebase Docs',
                      subtitle: 'Due Oct 06 - Medium',
                      checked: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
