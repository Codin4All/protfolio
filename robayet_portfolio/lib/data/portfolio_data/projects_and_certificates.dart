part of '../portfolio_data.dart';

const projects = [
  ProjectModel(
    name: 'Firebase Push Notification + Local Notification',
    description:
        'A Flutter task manager with Firebase push notifications, local task reminders, and Firestore-powered task updates.',
    technologies: [
      'Flutter',
      'Dart',
      'Firebase Cloud Messaging',
      'Cloud Firestore',
      'Local Notifications',
    ],
    categories: ['Mobile Apps', 'Firebase', 'Notifications'],
    featured: true,
    image: 'assets/images/Gemini_Generated_Image_tvj3iptvj3iptvj3 (2).jpg',
    imageAspectRatio: 1680 / 590,
    githubUrl: 'https://github.com/Codin4All/assignment-_ostad_16',
  ),
  ProjectModel(
    name: 'Task Manager App',
    description:
        'A mobile task manager assignment covering account access, task CRUD, API states, and profile management.',
    technologies: [
      'Flutter',
      'Dart',
      'REST API',
      'Authentication',
      'Task CRUD',
      'Responsive UI',
    ],
    categories: ['Mobile Apps', 'API Integration', 'Task Management'],
    image: 'assets/images/Gemini_Generated_Image_soyei7soyei7soye (1).jpg',
    imageAspectRatio: 912 / 1216,
    githubUrl: 'https://github.com/Codin4All/assignment-_ostad_13__module-',
    detailsKind: ProjectDetailsKind.taskManager,
  ),
  ProjectModel(
    name: 'REST API Product CRUD App',
    description:
        'A Flutter product inventory app with live API data, validated forms, automatic total pricing, and complete create, read, update, and delete flows.',
    technologies: [
      'Flutter',
      'Dart',
      'REST API',
      'HTTP',
      'CRUD',
      'Form Validation',
    ],
    categories: ['Mobile Apps', 'API Integration', 'CRUD Operations'],
    image: 'assets/images/Gemini_Generated_Image_a6a2zua6a2zua6a2 (3).jpg',
    imageAspectRatio: 864 / 1231,
    githubUrl: 'https://github.com/Codin4All/REST-API-CRUD-Operation-',
    detailsKind: ProjectDetailsKind.productCrud,
  ),
  ProjectModel(
    name: 'Contact Management App',
    description:
        'A Flutter contact manager with local database storage, contact CRUD, name search, and favorite filtering.',
    technologies: [
      'Flutter',
      'Dart',
      'Local Database',
      'CRUD Operations',
      'Name Search',
      'Favorites',
    ],
    categories: [
      'Mobile Apps',
      'Local Database',
      'CRUD Operations',
      'Contact Management',
    ],
    image: 'assets/images/Contact_Management_app.png',
    imageAspectRatio: 1110 / 911,
    githubUrl:
        'https://github.com/Codin4All/Contact-Management-projectd-in-flutter-',
    detailsKind: ProjectDetailsKind.contactManagement,
  ),
  ProjectModel(
    name: 'Notes App',
    description:
        'A Flutter notes app with local persistence, note CRUD, title search, and a dedicated note details screen.',
    technologies: [
      'Flutter',
      'Dart',
      'Local Storage',
      'CRUD Operations',
      'Title Search',
      'Navigation',
    ],
    categories: [
      'Mobile Apps',
      'Local Database',
      'CRUD Operations',
      'Notes',
    ],
    image: 'assets/images/Note_App.jpg',
    imageAspectRatio: 864 / 1215,
    githubUrl: 'https://github.com/Codin4All/livetest2_/tree/master/lib',
    detailsKind: ProjectDetailsKind.notes,
  ),
  ProjectModel(
    name: 'Flashcard Quiz App',
    description:
        'A Flutter study app with question and answer flashcards, Previous and Next navigation, and tools to add, edit, and delete cards.',
    technologies: [
      'Flutter',
      'Dart',
      'Flashcards',
      'Quiz Navigation',
      'Card Management',
    ],
    categories: ['Mobile Apps', 'Study Tools', 'Flashcards'],
    image: 'assets/images/Gemini_Generated_Image_r0sd3jr0sd3jr0sd.jpg',
    imageAspectRatio: 1706 / 624,
    githubUrl: 'https://github.com/Codin4All/Flashcard-Quiz-App-',
    detailsKind: ProjectDetailsKind.flashcards,
  ),
  ProjectModel(
    name: 'Product Cart App using Provider',
    description:
        'A Flutter shopping cart assignment using Provider and ChangeNotifier for local product browsing, cart quantities, and automatic totals.',
    technologies: [
      'Flutter',
      'Dart',
      'Provider',
      'ChangeNotifier',
      'State Management',
    ],
    categories: [
      'Mobile Apps',
      'State Management',
      'Provider',
      'Shopping Cart',
    ],
    featured: true,
    githubUrl: 'https://github.com/Codin4All/Provider-State-Management',
    detailsKind: ProjectDetailsKind.providerCart,
  ),
  ProjectModel(
    name: 'LinguaLearn - Bengali Language Learning App',
    description:
        'An interactive Flutter language learning app with daily lessons, vocabulary and grammar practice, translations, pronunciation, quizzes, and progress tracking.',
    technologies: [
      'Flutter',
      'Dart',
      'Language Learning',
      'Daily Lessons',
      'Quizzes',
      'Firebase Sync',
    ],
    categories: [
      'Mobile Apps',
      'Language Learning',
      'Education',
      'Quizzes',
      'Firebase',
    ],
    image: 'assets/images/the_interactive_bengalilernig.jpg',
    imageAspectRatio: 723 / 1024,
    githubUrl: 'https://github.com/Codin4All/Language-Learning-App-',
    detailsKind: ProjectDetailsKind.languageLearning,
  ),
  ProjectModel(
    name: 'Random Quote Generator',
    description:
        'A clean quote app that displays a random thought with its author on launch and whenever a new quote is requested.',
    technologies: [
      'Flutter',
      'Dart',
      'Random Quotes',
      'Minimal UI',
    ],
    categories: ['Mobile Apps', 'Random Quotes', 'Quote Generator'],
    image: 'assets/images/Random_Quote_Generator.jpg',
    imageAspectRatio: 730 / 1024,
    githubUrl: 'https://github.com/Codin4All/Random-Quote-Generator',
    detailsKind: ProjectDetailsKind.randomQuotes,
  ),
];

/// Set category to 'Professional Certificates' or 'Awards & Conferences' to
/// place a credential under its matching filter. All Credentials shows every item.
const certificates = [
  CertificateModel(
    title: 'Shift-Left Security (Software Quality Assurance – SQA)',
    issuer: 'Technical & Further Education (BUBT-TAFE)',
    year: 'Date not shown',
    category: 'Awards & Conferences',
    image: 'assets/certificates/shift_left_security_sqa.jpeg',
    description:
        'Participation certificate awarded to Ferdoce Siam for successfully '
        'completing and actively participating in the Shift-Left Security '
        '(Software Quality Assurance – SQA) workshop. Organized by '
        'Technical & Further Education (BUBT-TAFE) in collaboration with the '
        'Department of CSE, BUBT, and Bug Bound QA. Shift-left SQA focuses '
        'quality assurance earlier in the software development lifecycle.',
  ),
  CertificateModel(
    title: 'Web Development with Java Career Launchpad 2026',
    issuer: 'Ostad',
    year: '2026',
    category: 'Professional Certificates',
    image: 'assets/certificates/web_development_java_career_launchpad_2026.png',
    credentialId: 'C42944',
    description:
        'Certificate of completion awarded to Robayet Ferdosh for completing '
        'the Web Development with Java Career Launchpad 2026 course. The '
        'certificate lists Mohammad Sheikh Ghazanfar as “Ostad The Coach” '
        'and includes the signature of Ostad CEO Abdullah Al Musabbir.',
  ),
  CertificateModel(
    title: 'Brainstorming Week – Certificate of Participation',
    issuer: 'Department of Computer Science and Engineering, BUBT',
    year: '2024',
    category: 'Awards & Conferences',
    image: 'assets/certificates/bubt_brainstorming_week_2024.jpeg',
    description:
        'Participation certificate for the intra-university programming '
        'contest for the junior division, held on May 16, 2024 during '
        'Brainstorming Week. Organized by the Department of Computer Science '
        'and Engineering at BUBT in association with BUBT IT Club.',
  ),
  CertificateModel(
    title: 'AI Battle 2024 – Python Intermediate Segment',
    issuer: 'Department of CSE, BUBT & AI Community (AIC)',
    year: '2024',
    category: 'Awards & Conferences',
    image: 'assets/certificates/bubt_ai_battle_python_intermediate_2024.jpeg',
    credentialId: '22235103337',
    description:
        'Certificate of participation in the Python Intermediate segment of '
        'AI Battle 2024, held on November 2, 2024. Organized by the '
        'Department of Computer Science and Engineering at BUBT in association '
        'with the AI Community (AIC).',
  ),
];
