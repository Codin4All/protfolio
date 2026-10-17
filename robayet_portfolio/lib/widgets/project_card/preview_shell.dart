part of '../project_card.dart';

class _ProjectPreview extends StatelessWidget {
  final ProjectModel project;

  const _ProjectPreview({required this.project});

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF17233D),
                  Color(0xFF101421),
                  Color(0xFF080B14),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: Container(
              width: 150,
              height: 125,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent.withValues(alpha: 0.11),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.2),
                    blurRadius: 52,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 45, 13, 11),
              child: project.detailsKind == ProjectDetailsKind.productCrud
                  ? const _ProductCrudPreview()
                  : _TaskManagerPreview(project: project),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.1),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.36),
                    ],
                    stops: const [0, 0.48, 1],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 12,
            left: 13,
            child: _PreviewBadge(
              label: 'Flutter App',
              icon: Icons.phone_android_rounded,
            ),
          ),
          Positioned(
            top: 12,
            right: 13,
            child: _PreviewBadge(
              label: project.featured ? 'Featured' : 'Case Study',
              icon: project.featured
                  ? Icons.star_rounded
                  : Icons.checklist_rounded,
              color: project.featured ? AppColors.pink : AppColors.violet,
            ),
          ),
        ],
      );
}

class _PreviewBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _PreviewBadge({
    required this.label,
    required this.icon,
    this.color = AppColors.accent,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF080A14).withValues(alpha: 0.76),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.34)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 12, color: color),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _TaskManagerPreview extends StatelessWidget {
  final ProjectModel project;

  const _TaskManagerPreview({required this.project});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final phoneWidth = constraints.maxWidth < 320 ? 68.0 : 78.0;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                right: phoneWidth - 10,
                child: _TaskDashboard(project: project),
              ),
              Positioned(
                right: 0,
                top: 1,
                bottom: 0,
                width: phoneWidth,
                child: const _TaskPhone(),
              ),
              Positioned(
                left: 12,
                bottom: 7,
                child: _NotificationToast(width: phoneWidth < 70 ? 138 : 158),
              ),
            ],
          );
        },
      );
}
