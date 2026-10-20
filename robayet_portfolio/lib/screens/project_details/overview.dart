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
    if (project.detailsKind == ProjectDetailsKind.contactManagement) {
      return const _ContactManagementProjectDetailsContent();
    }
    if (project.detailsKind == ProjectDetailsKind.notes) {
      return const _NotesProjectDetailsContent();
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

class _NotesProjectDetailsContent extends StatelessWidget {
  const _NotesProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.sticky_note_2_outlined,
            child: Text(
              'Create a clean Flutter notes app that stores notes locally. Users can manage notes, search by title, and open a dedicated Note Details screen.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Note Management',
            icon: Icons.edit_note_rounded,
            child: _BulletList(items: [
              'Add new notes and display all saved notes.',
              'Edit existing notes and delete notes.',
              'Open an individual note in its details screen.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Note Details',
            icon: Icons.description_outlined,
            child: _ChipList(items: [
              'Title',
              'Description',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Local Storage',
            icon: Icons.storage_rounded,
            child: Text(
              'Save notes on the device and retain them after the app is closed and reopened. Hive, SharedPreferences, or another local storage option can be used.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Search & Navigation',
            icon: Icons.search_rounded,
            child: _BulletList(items: [
              'Find notes by title with the search option.',
              'Keep navigation between the notes list and Note Details screen clear and reliable.',
              'Use a simple, clean interface for note tasks.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Testing & Reliability',
            icon: Icons.fact_check_outlined,
            child: _BulletList(items: [
              'Test add, list, edit, and delete flows.',
              'Verify saved notes remain after closing and reopening the app.',
              'Check title search, details navigation, and the UI; fix any logic or storage errors found.',
            ]),
          ),
        ],
      );
}

class _ContactManagementProjectDetailsContent extends StatelessWidget {
  const _ContactManagementProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.contacts_rounded,
            child: Text(
              'Build a Flutter Contact Management App backed by a local database. Users can create, view, update, and delete saved contacts, search by name, and filter the list to show favorites.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Contact Management Features',
            icon: Icons.checklist_rounded,
            child: _BulletList(items: [
              'Add new contacts and view all saved contacts.',
              'Update contact information and delete contacts.',
              'Search saved contacts by name.',
              'Keep contact records in a local database.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Contact Information',
            icon: Icons.badge_outlined,
            child: _ChipList(items: [
              'ID',
              'Name',
              'Phone Number',
              'Email',
              'Address',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Favorite Contacts',
            icon: Icons.star_outline_rounded,
            child: Text(
              'Mark contacts as favorites and filter the contact list to show only favorite contacts.',
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
