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
    githubUrl:
        'https://github.com/Codin4All/assignment-_ostad_13__module-',
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
    detailsKind: ProjectDetailsKind.productCrud,
  ),
];

/// PLACEHOLDERS - replace with your real certificates before publishing.
/// Set category to 'Professional Certificates' or 'Awards & Conferences' to
/// place a credential under its matching filter. All Credentials shows every item.
const certificates = [
  CertificateModel(
    title: 'Certificate title (replace me)',
    issuer: 'Platform / Organization',
    year: 'Year',
  ),
  CertificateModel(
    title: 'Certificate title (replace me)',
    issuer: 'Platform / Organization',
    year: 'Year',
  ),
];
