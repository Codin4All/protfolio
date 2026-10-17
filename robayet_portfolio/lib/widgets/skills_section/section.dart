part of '../skills_section.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _selectedCategory = skillCategories.first;

  List<PortfolioSkill> get _visibleSkills => _selectedCategory ==
          skillCategories.first
      ? skills
      : skills.where((skill) => skill.category == _selectedCategory).toList();

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Skills & Technologies',
      eyebrow: 'TECHNICAL STACK',
      subtitle:
          'The tools and technologies I use across web, mobile, database, and embedded projects.',
      child: Column(
        children: [
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 9,
              runSpacing: 10,
              children: [
                for (final category in skillCategories)
                  _SkillCategoryChip(
                    label: category,
                    selected: _selectedCategory == category,
                    onTap: () => setState(() => _selectedCategory = category),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 320),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: LayoutBuilder(
              key: ValueKey(_selectedCategory),
              builder: (context, constraints) {
                final cardWidth = gridItemWidth(
                  constraints.maxWidth,
                  maxCols: 5,
                  minItem: 150,
                  gap: 14,
                );
                return Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    for (final skill in _visibleSkills)
                      SectionReveal(
                        child: SizedBox(
                          width: cardWidth,
                          child: _SkillCard(skill: skill),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
