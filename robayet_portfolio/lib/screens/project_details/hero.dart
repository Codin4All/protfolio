part of '../project_details_screen.dart';

class _ProjectHero extends StatelessWidget {
  final ProjectModel project;
  const _ProjectHero({required this.project});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 760;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const _MetaBadge(
              label: 'MOBILE APP',
              color: AppColors.accent,
            ),
            _MetaBadge(
              label: project.featured
                  ? 'FEATURED PROJECT'
                  : project.detailsKind == ProjectDetailsKind.productCrud
                      ? 'PRODUCT CRUD'
                      : 'TASK MANAGEMENT',
              color: project.featured
                  ? const Color(0xFFC47BFF)
                  : AppColors.success,
              icon: project.featured
                  ? Icons.star_rounded
                  : Icons.checklist_rounded,
            ),
            _MetaBadge(
              label: project.detailsKind == ProjectDetailsKind.productCrud
                  ? 'REST API INTEGRATION'
                  : 'ASSIGNMENT BRIEF',
              color: const Color(0xFFFFC563),
              icon: Icons.menu_book_rounded,
            ),
          ],
        ),
        const SizedBox(height: 17),
        Text(
          project.name,
          style: TextStyle(
            color: AppColors.text,
            fontSize: mobile ? 34 : 54,
            height: 1.05,
            fontWeight: FontWeight.w900,
            letterSpacing: mobile ? -1.3 : -2.2,
          ),
        ),
        const SizedBox(height: 13),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Text(
            project.detailsKind == ProjectDetailsKind.taskManager
                ? 'A mobile task manager assignment covering account access, profile management, task workflows, and API-backed CRUD.'
                : project.detailsKind == ProjectDetailsKind.productCrud
                    ? 'A Flutter product inventory app with live REST API data, validated create and edit forms, automatic total pricing, and reliable delete and refresh flows.'
                    : 'A Flutter task manager assignment covering Firebase Authentication, Firestore task management, FCM push notifications, and local notifications.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: mobile ? 15 : 18,
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (project.detailsKind == ProjectDetailsKind.taskManager)
          const _TaskManagerShowcase()
        else if (project.detailsKind == ProjectDetailsKind.productCrud)
          const _ProductCrudShowcase()
        else
          const _NotificationFlowHero(),
      ],
    );
  }
}

class _MetaBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const _MetaBadge({
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.32)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 12, color: color),
              const SizedBox(width: 5),
            ],
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.35,
              ),
            ),
          ],
        ),
      );
}
