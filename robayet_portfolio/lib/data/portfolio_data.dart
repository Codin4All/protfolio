// ALL editable content lives here. Change values; no UI code needs touching.
import 'package:flutter/material.dart';
import '../models/certificate_model.dart';
import '../models/project_model.dart';

const ownerName = 'Md. Robayet Ferodus';
const ownerShortName = 'Robayet';
const ownerTitle = 'Flutter Developer';
const ownerSubtitle = 'Software Engineering Student';
const heroIntro =
    'I build web, mobile, and embedded projects with HTML, Flutter, Kotlin, Java, Arduino, and ESP32.';
const availabilityBadge = 'Open to opportunities';
const profileImage = 'assets/images/profile.png';

const email = 'robayetferodosh@gmail.com';
const phoneNumber = '01568196458';
const contactLocation = 'Rupnagar, Mirpur 2, Dhaka';
const phoneUrl = 'tel:+8801568196458';

/// Add a CV link when the resume file is ready.
const cvUrl = '';

const navItems = [
  'Home',
  'About',
  'Skills',
  'Projects',
  'Education',
  'Certificates & Credentials',
  'Contact',
];

const aboutText =
    "I'm a Computer Science & Engineering student focused on building useful "
    'web, mobile, and embedded projects. I work with C, C++, HTML, Flutter, '
    'Kotlin, Java, REST APIs, and Firebase, as well as MySQL and MongoDB. '
    'I also build with Arduino and ESP32 and use tools such as Android Studio, '
    'Postman, Linux, and Visual Studio Code.';

const aboutCards = [
  ['Location', contactLocation],
  ['Role', 'Flutter Developer'],
  ['Field', 'Computer Science & Engineering'],
];

class PortfolioSkill {
  final String name;
  final String? level;
  final String category;
  final String symbol;

  const PortfolioSkill({
    required this.name,
    required this.category,
    required this.symbol,
    this.level,
  });
}

const skillCategories = [
  'All Technologies',
  'Web Interface',
  'Mobile Apps',
  'Backend & APIs',
  'Databases & ORMs',
  'Programming Languages',
  'IoT & Embedded',
  'Tools & IDE',
];

const skills = [
  PortfolioSkill(
    name: 'HTML',
    level: 'Advanced',
    category: 'Web Interface',
    symbol: '5',
  ),
  PortfolioSkill(
    name: 'Arduino',
    level: 'Proficient',
    category: 'IoT & Embedded',
    symbol: '∞',
  ),
  PortfolioSkill(
    name: 'Android Studio',
    level: 'Advanced',
    category: 'Tools & IDE',
    symbol: 'A',
  ),
  PortfolioSkill(
    name: 'ESP32',
    level: 'Proficient',
    category: 'IoT & Embedded',
    symbol: 'ESP',
  ),
  PortfolioSkill(
    name: 'Arduino',
    level: 'Advanced',
    category: 'IoT & Embedded',
    symbol: '∞',
  ),
  PortfolioSkill(
    name: 'Postman',
    level: 'Proficient',
    category: 'Backend & APIs',
    symbol: '↗',
  ),
  PortfolioSkill(
    name: 'MySQL',
    level: 'Advanced',
    category: 'Databases & ORMs',
    symbol: 'SQL',
  ),
  PortfolioSkill(
    name: 'Linux',
    level: 'Advanced',
    category: 'Tools & IDE',
    symbol: 'L',
  ),
  PortfolioSkill(
    name: 'Kotlin',
    level: 'Proficient',
    category: 'Mobile Apps',
    symbol: 'K',
  ),
  PortfolioSkill(
    name: 'Java',
    level: 'Proficient',
    category: 'Mobile Apps',
    symbol: '☕',
  ),
  PortfolioSkill(
    name: 'Visual Studio Code',
    level: 'Proficient',
    category: 'Tools & IDE',
    symbol: '<>',
  ),
  PortfolioSkill(
    name: 'Flutter',
    level: 'Proficient',
    category: 'Mobile Apps',
    symbol: 'F',
  ),
  PortfolioSkill(
    name: 'C Programming',
    category: 'Programming Languages',
    symbol: 'C',
  ),
  PortfolioSkill(
    name: 'C++',
    category: 'Programming Languages',
    symbol: 'C++',
  ),
  PortfolioSkill(
    name: 'REST API',
    category: 'Backend & APIs',
    symbol: 'API',
  ),
  PortfolioSkill(
    name: 'Firebase',
    category: 'Backend & APIs',
    symbol: 'FB',
  ),
  PortfolioSkill(
    name: 'MongoDB',
    category: 'Databases & ORMs',
    symbol: 'MDB',
  ),
];

final skillGroups = {
  for (final category in skillCategories.skip(1))
    category: skills
        .where((skill) => skill.category == category)
        .map((skill) => skill.name)
        .toSet()
        .toList(growable: false),
};

/// TODO: add each repo link in githubUrl. Add liveUrl ONLY if a real demo exists.
const projects = [
  ProjectModel(
    name: 'E-Commerce App',
    description:
        'Flutter-based e-commerce application with REST API integration, product browsing and modern UI.',
    technologies: ['Flutter', 'Dart', 'REST API'],
    image: 'assets/images/project_1.png',
  ),
  ProjectModel(
    name: 'Learning Management System (LMS)',
    description:
        'Academic/learning management project for handling learning-related data and operations.',
    technologies: ['Java', 'MySQL', 'JDBC'],
    image: 'assets/images/project_2.png',
  ),
  ProjectModel(
    name: 'Car Rental System',
    description:
        'Car rental management system focused on vehicle information, booking and organized data handling.',
    technologies: ['Java', 'MySQL'],
    image: 'assets/images/project_3.png',
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

const degree = 'B.Sc. in Computer Science & Engineering';
const university = 'Bangladesh University of Business and Technology (BUBT)';
const universityLocation = 'Dhaka, Bangladesh';

class SocialLink {
  final String label;
  final String url;
  final IconData icon;
  const SocialLink(this.label, this.url, this.icon);
}

const socialLinks = [
  SocialLink('GitHub', 'https://github.com/Codin4All', Icons.code),
  SocialLink('LinkedIn',
      'https://www.linkedin.com/in/robayet-ferdosh-667310299', Icons.work_outline),
  SocialLink('Facebook', 'https://www.facebook.com/robayeth.ferdosh', Icons.facebook),
  SocialLink('Instagram', 'https://www.instagram.com/robayet_ferdous_',
      Icons.camera_alt_outlined),
];
