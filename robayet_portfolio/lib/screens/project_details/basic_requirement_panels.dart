part of '../project_details_screen.dart';

class _FirebaseAndAuthenticationPanels extends StatelessWidget {
  const _FirebaseAndAuthenticationPanels();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: '1. Firebase Setup',
            icon: Icons.local_fire_department_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect the Flutter app to a Firebase project and initialize the services used by the assignment.',
                  style: TextStyle(
                      color: AppColors.muted, fontSize: 12, height: 1.55),
                ),
                SizedBox(height: 12),
                _ChipList(items: [
                  'Firebase Core',
                  'Firebase Authentication',
                  'Cloud Firestore',
                  'Firebase Cloud Messaging',
                ]),
              ],
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: '2. Authentication',
            icon: Icons.person_outline_rounded,
            child: _BulletList(items: [
              'Sign in with email and password.',
              'Create an account through the Sign Up option.',
              'Offer Google Sign In.',
              'Allow users to sign in and access their task list.',
            ]),
          ),
        ],
      );
}

class _TaskManagementPanel extends StatelessWidget {
  const _TaskManagementPanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: '3. Task Management',
        icon: Icons.checklist_rounded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BulletList(items: [
              'View all tasks, add new tasks, edit tasks, and delete tasks.',
              'Mark tasks as completed and set priority and due date.',
              'Store task records in Cloud Firestore.',
            ]),
            SizedBox(height: 15),
            Text(
              'TASK FIELDS',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 9),
            _ChipList(items: [
              'Title',
              'Description',
              'Due date',
              'Priority',
              'Completed status',
              'Created date',
            ]),
          ],
        ),
      );
}
