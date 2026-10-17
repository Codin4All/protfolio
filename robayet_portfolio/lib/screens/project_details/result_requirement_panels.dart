part of '../project_details_screen.dart';

class _ExpectedAndBonusPanels extends StatelessWidget {
  const _ExpectedAndBonusPanels();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Expected Result',
            icon: Icons.emoji_events_outlined,
            child: _CheckGrid(items: [
              'Firebase Authentication',
              'Google Sign In',
              'Firestore task CRUD',
              'Task list and task forms',
              'Priority and completion',
              'FCM push notifications',
              'Local notifications',
              'Foreground, background, and terminated handling',
              'Notification tap routing',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Bonus Ideas',
            icon: Icons.auto_awesome_rounded,
            child: _BulletList(items: [
              'Ask for confirmation before deleting a task.',
              'Add task search and Pending / Completed filters.',
              'Open the exact task when its notification is tapped.',
              'Show different notifications based on task priority.',
            ]),
          ),
        ],
      );
}
