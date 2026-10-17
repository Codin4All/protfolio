part of '../skills_section.dart';

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
