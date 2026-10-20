part of '../project_details_screen.dart';

class _ProjectSidebar extends StatelessWidget {
  final ProjectModel project;
  final int reviewCount;
  final VoidCallback onWriteReview;
  final VoidCallback onReadReviews;

  const _ProjectSidebar({
    required this.project,
    required this.reviewCount,
    required this.onWriteReview,
    required this.onReadReviews,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Links',
            icon: Icons.link_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton.icon(
                  onPressed: project.githubUrl.isEmpty
                      ? null
                      : () => openLink(project.githubUrl),
                  icon: const Icon(Icons.code_rounded, size: 16),
                  label: Text(project.githubUrl.isEmpty
                      ? 'Source code link not added'
                      : 'View Source Code'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.muted,
                    disabledForegroundColor:
                        AppColors.muted.withValues(alpha: 0.7),
                    side: const BorderSide(color: AppColors.border),
                    minimumSize: const Size.fromHeight(44),
                    textStyle: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  height: 46,
                  child: GradientButton(
                    label: 'Write a Review',
                    icon: Icons.star_rounded,
                    onPressed: onWriteReview,
                    height: 46,
                  ),
                ),
                const SizedBox(height: 6),
                TextButton(
                  onPressed: onReadReviews,
                  child: Text(
                    'Read client evaluations ↓  ($reviewCount)',
                    style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                if (project.detailsKind ==
                    ProjectDetailsKind.firebaseNotifications) ...[
                  const SizedBox(height: 4),
                  OutlinedButton.icon(
                    onPressed: () => openLink(_figmaUrl),
                    icon: const Icon(Icons.design_services_outlined, size: 15),
                    label: const Text('Open Figma Design'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.accent,
                      side: BorderSide(
                          color: AppColors.accent.withValues(alpha: 0.28)),
                      minimumSize: const Size.fromHeight(40),
                      textStyle: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          _DetailPanel(
            title: 'Technologies Used',
            icon: Icons.sell_outlined,
            child: _ChipList(items: project.technologies),
          ),
          const SizedBox(height: 16),
          if (project.detailsKind == ProjectDetailsKind.taskManager)
            const _DetailPanel(
              title: 'App Workflow',
              icon: Icons.account_tree_outlined,
              child: _TaskManagerFlowList(),
            )
          else if (project.detailsKind == ProjectDetailsKind.productCrud)
            const _DetailPanel(
              title: 'API CRUD Workflow',
              icon: Icons.account_tree_outlined,
              child: _ProductCrudFlowList(),
            )
          else if (project.detailsKind ==
              ProjectDetailsKind.contactManagement)
            const _DetailPanel(
              title: 'Contact Workflow',
              icon: Icons.account_tree_outlined,
              child: _BulletList(items: [
                'Create, view, edit, and delete contacts.',
                'Search contacts by name and filter favorites.',
                'Save contact changes in the local database.',
              ]),
            )
          else if (project.detailsKind == ProjectDetailsKind.notes)
            const _DetailPanel(
              title: 'Notes Workflow',
              icon: Icons.account_tree_outlined,
              child: _BulletList(items: [
                'Add, view, edit, and delete notes.',
                'Search notes by title and open note details.',
                'Retain saved notes after app restart.',
              ]),
            )
          else
            const _DetailPanel(
              title: 'Notification Flow',
              icon: Icons.account_tree_outlined,
              child: _CompactFlowList(),
            ),
          const SizedBox(height: 16),
          _DetailPanel(
            title: switch (project.detailsKind) {
              ProjectDetailsKind.taskManager => 'API Integration',
              ProjectDetailsKind.productCrud => 'REST API Integration',
              ProjectDetailsKind.contactManagement => 'Local Storage',
              ProjectDetailsKind.notes => 'Local Storage',
              ProjectDetailsKind.firebaseNotifications => 'Assignment Focus',
            },
            icon: Icons.track_changes_rounded,
            child: Text(
              switch (project.detailsKind) {
                ProjectDetailsKind.taskManager =>
                  'Connect sign-in, registration, profile, task list, status, create, and delete operations to the supplied API, with clear request feedback.',
                ProjectDetailsKind.productCrud =>
                  'Load products with GET, create them with POST, update them with PUT, and remove them with DELETE. Refresh the product list after each successful change.',
                ProjectDetailsKind.contactManagement =>
                  'Store each contact, including its favorite status, in the device database and keep the saved list current after create, edit, and delete actions.',
                ProjectDetailsKind.notes =>
                  'Save notes on the device and reload them after the app is reopened. Verify that edits, deletes, and title search keep the stored list in sync.',
                ProjectDetailsKind.firebaseNotifications =>
                  'Implement the full notification lifecycle: FCM in the background, local alerts in the foreground, and task routing when a notification is opened.',
              },
              style: const TextStyle(
                  color: AppColors.muted, fontSize: 11, height: 1.6),
            ),
          ),
        ],
      );
}
