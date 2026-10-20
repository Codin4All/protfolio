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
    if (project.detailsKind == ProjectDetailsKind.flashcards) {
      return const _FlashcardProjectDetailsContent();
    }
    if (project.detailsKind == ProjectDetailsKind.providerCart) {
      return const _ProviderCartProjectDetailsContent();
    }
    if (project.detailsKind == ProjectDetailsKind.languageLearning) {
      return const _LanguageLearningProjectDetailsContent();
    }
    if (project.detailsKind == ProjectDetailsKind.randomQuotes) {
      return const _RandomQuoteProjectDetailsContent();
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

class _RandomQuoteProjectDetailsContent extends StatelessWidget {
  const _RandomQuoteProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.format_quote_rounded,
            child: Text(
              'Build a clean and minimal Random Quote Generator. Each time the app opens, it presents a randomly selected quote; users can request another quote at any time.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Random Quote Display',
            icon: Icons.auto_awesome_rounded,
            child: _BulletList(items: [
              'Choose and display a random quote whenever the app is opened.',
              'Show the quote text and its author clearly together.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'New Quote Action',
            icon: Icons.refresh_rounded,
            child: _BulletList(items: [
              'Provide a clearly labeled New Quote button.',
              'Select and display another quote when the button is pressed.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Interface & Assignment',
            icon: Icons.dashboard_customize_outlined,
            child: Text(
              'Keep the quote easy to read in a simple, minimal interface. This project is associated with the CodeAlpha assignment program; its reference link is available in Project Links.',
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

class _ProviderCartProjectDetailsContent extends StatelessWidget {
  const _ProviderCartProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.shopping_cart_rounded,
            child: Text(
              'Build a Flutter shopping cart app that demonstrates Provider state management. Product data stays in a local in-app list, while Provider keeps the cart and its totals in sync across screens. The assignment requires no backend, Firebase, API, or database.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Product List Screen',
            icon: Icons.storefront_outlined,
            child: _BulletList(items: [
              'Display at least six products from a local list.',
              'Show each product’s name, price, and image or icon.',
              'Provide an Add to Cart action for every product.',
              'Update the AppBar cart item count when products are added.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Provider State Management',
            icon: Icons.account_tree_rounded,
            child: _BulletList(items: [
              'Create a CartProvider with ChangeNotifier to own cart state.',
              'Use Provider with Consumer, context.watch(), or context.read() to access and update that state.',
              'Do not use setState() for cart-related state.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Cart Screen & Item Controls',
            icon: Icons.shopping_basket_outlined,
            child: _BulletList(items: [
              'List each cart item with its product name, price, and quantity.',
              'Provide plus and minus quantity controls and a remove action.',
              'Recalculate quantities and the cart total automatically after changes.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Cart Summary',
            icon: Icons.receipt_long_outlined,
            child: _BulletList(items: [
              'Show total items, subtotal, discount, and final total.',
              'Apply a 10% discount when the subtotal is above ৳2,000.',
              'Include a Clear Cart action that removes every cart item.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Empty Cart & Navigation',
            icon: Icons.remove_shopping_cart_outlined,
            child: _BulletList(items: [
              'Show an appropriate message when the cart has no products.',
              'Provide a button that returns to the product list.',
              'Keep the product list and cart navigation simple and clear.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Bonus: Search & Category Filter',
            icon: Icons.filter_list_rounded,
            child: _BulletList(items: [
              'Search the local product list by text.',
              'Filter products by a selected category.',
              'Manage the selected category or filter through Provider.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Local-only Technical Scope',
            icon: Icons.phone_android_rounded,
            child: Text(
              'Use Flutter and the Provider package with ChangeNotifier. Keep product data local and cart state in memory. Do not add Firebase, Supabase, REST APIs, a database, GetX, Riverpod, or Bloc.',
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

class _LanguageLearningProjectDetailsContent extends StatelessWidget {
  const _LanguageLearningProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.translate_rounded,
            child: Text(
              'LinguaLearn is an interactive Bengali language learning app. Help learners build vocabulary and practical language skills with short lessons, translations, pronunciation support, quizzes, and a view of their progress.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Words, Phrases & Sentences',
            icon: Icons.menu_book_rounded,
            child: _BulletList(items: [
              'Teach new vocabulary, useful phrases, and complete sentences in the selected language.',
              'Show translations alongside the learning content.',
              'Include pronunciation guidance so learners can practice speaking.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Daily Lessons & Flashcards',
            icon: Icons.style_rounded,
            child: _BulletList(items: [
              'Offer short daily lessons or flashcards for regular practice.',
              'Present the target text, its translation, and pronunciation together.',
              'Organize lessons into vocabulary, grammar, phrases, and related categories.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Quizzes & Practice Tests',
            icon: Icons.quiz_outlined,
            child: _BulletList(items: [
              'Let learners take quizzes or practice tests to check understanding.',
              'Show quiz results and scores when a practice session is complete.',
              'Provide a clear option to try a quiz again.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Progress Tracking',
            icon: Icons.insights_rounded,
            child: _BulletList(items: [
              'Track completed lessons and quiz scores over time.',
              'Show learning progress in a clear dashboard or growth chart.',
              'Help learners see their daily activity and areas to practice.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Categories & User Experience',
            icon: Icons.category_outlined,
            child: Text(
              'Use a clean, intuitive interface with easy-to-browse categories such as vocabulary, grammar, and phrases. Keep lesson, quiz, result, and progress screens easy to navigate.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Learning Data & Sync',
            icon: Icons.sync_rounded,
            child: Text(
              'Store lessons and learning progress locally on the device, or synchronize them through a backend such as Firebase. The showcase includes a Firebase data-sync flow.',
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

class _FlashcardProjectDetailsContent extends StatelessWidget {
  const _FlashcardProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.style_rounded,
            child: Text(
              'Create a clean Flutter flashcard quiz app for studying. Each card presents a question on the front and its answer on the back, with simple controls for revealing answers, moving through cards, and maintaining a custom set.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Flashcard Details',
            icon: Icons.quiz_outlined,
            child: _BulletList(items: [
              'Show a question on the front of each flashcard.',
              'Reveal the answer on the back with a “Show Answer” button.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Study Navigation',
            icon: Icons.swap_horiz_rounded,
            child: _BulletList(items: [
              'Move to the next flashcard with Next.',
              'Return to the previous flashcard with Previous.',
              'Keep the study flow clear and easy to use.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Card Management',
            icon: Icons.edit_note_rounded,
            child: _BulletList(items: [
              'Add new flashcards for custom study material.',
              'Edit existing questions and answers.',
              'Delete flashcards that are no longer needed.',
            ]),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: 'Interface',
            icon: Icons.dashboard_customize_outlined,
            child: Text(
              'Use a simple, clean interface that makes it easy to review a question, reveal its answer, and manage cards.',
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
