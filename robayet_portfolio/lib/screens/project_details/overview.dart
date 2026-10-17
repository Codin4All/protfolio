part of '../project_details_screen.dart';

class _MainProjectDetails extends StatelessWidget {
  final ProjectModel project;

  const _MainProjectDetails({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.detailsKind == ProjectDetailsKind.taskManager) {
      return const _TaskManagerProjectDetailsContent();
    }
    if (project.detailsKind == ProjectDetailsKind.productCrud) {
      return const _ProductCrudProjectDetailsContent();
    }
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProjectIntroPanels(),
        SizedBox(height: 16),
        _ChallengeSolutionPanel(),
        SizedBox(height: 16),
        _FirebaseAndAuthenticationPanels(),
        SizedBox(height: 16),
        _TaskManagementPanel(),
        SizedBox(height: 16),
        _PushAndLocalNotificationPanels(),
        SizedBox(height: 16),
        _NotificationStatePanel(),
        SizedBox(height: 16),
        _ExpectedAndBonusPanels(),
      ],
    );
  }
}

class _ProjectIntroPanels extends StatelessWidget {
  const _ProjectIntroPanels();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Objective',
            icon: Icons.track_changes_rounded,
            child: Text(
              'Build a Firebase Task Manager app using Flutter. Authenticated users should manage tasks in Firestore and receive task-related push and local notifications.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.description_outlined,
            child: Text(
              'The assignment combines Firebase setup, Authentication, Firestore task CRUD, and notification behavior across foreground, background, and terminated app states.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
        ],
      );
}

class _ChallengeSolutionPanel extends StatelessWidget {
  const _ChallengeSolutionPanel();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final narrow = constraints.maxWidth < 560;
          const challenge = _ChallengeSolutionCard(
            title: 'The Challenge',
            color: Color(0xFFFF8199),
            text:
                'Keep task data and notification behavior reliable across sign-in and foreground, background, and terminated app states.',
            icon: Icons.flag_outlined,
          );
          const solution = _ChallengeSolutionCard(
            title: 'The Solution',
            color: AppColors.success,
            text:
                'Use Firebase for identity, storage, and remote messaging, then show a local notification for foreground FCM messages.',
            icon: Icons.check_circle_outline_rounded,
          );
          if (narrow) {
            return const Column(
              children: [
                challenge,
                SizedBox(height: 12),
                solution,
              ],
            );
          }
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: challenge),
              SizedBox(width: 14),
              Expanded(child: solution),
            ],
          );
        },
      );
}
