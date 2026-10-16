import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _selectedCategory = skillCategories.first;

  List<PortfolioSkill> get _visibleSkills =>
      _selectedCategory == skillCategories.first
          ? skills
          : skills
              .where((skill) => skill.category == _selectedCategory)
              .toList();

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

class _SkillCategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SkillCategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon {
    if (label == 'All Technologies') return Icons.code_rounded;
    if (label == 'Web Interface') return Icons.web_rounded;
    if (label == 'Mobile Apps') return Icons.phone_android_rounded;
    if (label == 'Backend & APIs') return Icons.api_rounded;
    if (label == 'Databases & ORMs') return Icons.storage_rounded;
    if (label == 'IoT & Embedded') return Icons.memory_rounded;
    return Icons.build_rounded;
  }

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              decoration: BoxDecoration(
                gradient: selected ? AppColors.accentGradient : null,
                color: selected ? null : AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected ? Colors.transparent : AppColors.border,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: AppColors.violet.withValues(alpha: 0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : const [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _icon,
                    size: 14,
                    color: selected ? Colors.white : AppColors.muted,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : AppColors.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _SkillCard extends StatefulWidget {
  final PortfolioSkill skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  Color get _levelColor {
    if (widget.skill.level == null) return AppColors.muted;
    if (widget.skill.level == 'Advanced') return AppColors.accent;
    if (widget.skill.level == 'Proficient') return AppColors.success;
    if (widget.skill.level == 'Foundational') return AppColors.pink;
    return AppColors.muted;
  }

  Color get _symbolColor {
    switch (widget.skill.category) {
      case 'Mobile Apps':
        return const Color(0xFF55BDF2);
      case 'Backend & APIs':
        return AppColors.pink;
      case 'Databases & ORMs':
        return AppColors.accent;
      case 'IoT & Embedded':
        return const Color(0xFF55D7A4);
      case 'Tools & IDE':
        return AppColors.violet;
      default:
        return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final skill = widget.skill;
    final levelLabel = skill.level ?? 'Not specified';
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        constraints: const BoxConstraints(minHeight: 120),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.violet.withValues(alpha: 0.11),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : const [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF172238),
                borderRadius: BorderRadius.circular(11),
              ),
              alignment: Alignment.center,
              child: Text(
                skill.symbol,
                maxLines: 1,
                style: TextStyle(
                  color: _symbolColor,
                  fontSize: skill.symbol.length > 2 ? 10 : 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: skill.symbol == '☕' ? null : 'monospace',
                ),
              ),
            ),
            const SizedBox(height: 9),
            Text(
              skill.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                color: _levelColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _levelColor.withValues(alpha: 0.5),
                ),
              ),
              child: Text(
                levelLabel,
                style: TextStyle(
                  color: _levelColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact technology tags reused by the project cards.
class SkillChip extends StatefulWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.surface : AppColors.surface2,
          borderRadius: BorderRadius.circular(8),
          border:
              Border.all(color: _hovered ? AppColors.accent : AppColors.border),
        ),
        child: Text(
          widget.label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
