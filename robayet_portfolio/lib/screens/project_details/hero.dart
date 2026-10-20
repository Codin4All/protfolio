part of '../project_details_screen.dart';

class _ProjectHero extends StatelessWidget {
  final ProjectModel project;
  const _ProjectHero({required this.project});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 760;
    final projectTypeBadge = project.featured
        ? 'FEATURED PROJECT'
        : switch (project.detailsKind) {
            ProjectDetailsKind.productCrud => 'PRODUCT CRUD',
            ProjectDetailsKind.contactManagement => 'CONTACT MANAGEMENT',
            ProjectDetailsKind.notes => 'NOTES APP',
            ProjectDetailsKind.flashcards => 'FLASHCARD QUIZ',
            ProjectDetailsKind.providerCart => 'SHOPPING CART',
            ProjectDetailsKind.languageLearning => 'LANGUAGE LEARNING',
            ProjectDetailsKind.randomQuotes => 'QUOTE GENERATOR',
            _ => 'TASK MANAGEMENT',
          };
    final projectFocusBadge = switch (project.detailsKind) {
      ProjectDetailsKind.productCrud => 'REST API INTEGRATION',
      ProjectDetailsKind.contactManagement => 'LOCAL DATABASE',
      ProjectDetailsKind.notes => 'LOCAL STORAGE',
      ProjectDetailsKind.flashcards => 'STUDY TOOLS',
      ProjectDetailsKind.providerCart => 'PROVIDER STATE',
      ProjectDetailsKind.languageLearning => 'DAILY LESSONS + QUIZZES',
      ProjectDetailsKind.randomQuotes => 'DAILY INSPIRATION',
      _ => 'ASSIGNMENT BRIEF',
    };
    final projectDescription = switch (project.detailsKind) {
      ProjectDetailsKind.taskManager =>
        'A mobile task manager assignment covering account access, profile management, task workflows, and API-backed CRUD.',
      ProjectDetailsKind.productCrud =>
        'A Flutter product inventory app with live REST API data, validated create and edit forms, automatic total pricing, and reliable delete and refresh flows.',
      ProjectDetailsKind.contactManagement =>
        'A Flutter contact manager backed by a local database, with contact CRUD, name search, and favorite filtering.',
      ProjectDetailsKind.notes =>
        'A Flutter notes app with persistent local storage, note creation and editing, title search, and a dedicated details screen.',
      ProjectDetailsKind.flashcards =>
        'A Flutter flashcard quiz app for studying with question and answer cards, answer reveal, Previous and Next navigation, and customizable cards.',
      ProjectDetailsKind.providerCart =>
        'A Flutter shopping cart app that uses Provider and ChangeNotifier to manage local products, cart items, quantities, and totals.',
      ProjectDetailsKind.languageLearning =>
        'An interactive Flutter language learning app with daily lessons, vocabulary and grammar categories, translation and pronunciation practice, quizzes, and progress tracking.',
      ProjectDetailsKind.randomQuotes =>
        'A clean and minimal quote app that presents a randomly selected quote with its author when opened and whenever the user asks for another.',
      ProjectDetailsKind.firebaseNotifications =>
        'A Flutter task manager assignment covering Firebase Authentication, Firestore task management, FCM push notifications, and local notifications.',
    };

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
              label: projectTypeBadge,
              color: project.featured
                  ? const Color(0xFFC47BFF)
                  : AppColors.success,
              icon: project.featured
                  ? Icons.star_rounded
                  : Icons.checklist_rounded,
            ),
            _MetaBadge(
              label: projectFocusBadge,
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
            projectDescription,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: mobile ? 15 : 18,
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (project.image.isNotEmpty) ...[
          LayoutBuilder(
            builder: (context, constraints) {
              final aspectRatio = project.imageAspectRatio ?? 1680 / 590;
              final maxImageWidth = 640 * aspectRatio;
              final imageWidth = constraints.maxWidth < maxImageWidth
                  ? constraints.maxWidth
                  : maxImageWidth;
              final imageHeight = imageWidth / aspectRatio;

              return Container(
                width: constraints.maxWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.border.withValues(alpha: 0.84),
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.asset(
                      project.image,
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
        if (project.detailsKind ==
            ProjectDetailsKind.firebaseNotifications)
          const _NotificationFlowHero(),
        if (project.detailsKind == ProjectDetailsKind.providerCart)
          const _ProviderCartFlowHero(),
        if (project.detailsKind == ProjectDetailsKind.languageLearning)
          const _LanguageLearningFlowHero(),
        if (project.detailsKind == ProjectDetailsKind.randomQuotes)
          const _RandomQuoteFlowHero(),
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
