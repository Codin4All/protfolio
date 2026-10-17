part of '../portfolio_data.dart';

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

/// Add project links in githubUrl/liveUrl only when the real URLs are available.
