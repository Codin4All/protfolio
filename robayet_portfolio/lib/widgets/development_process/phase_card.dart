part of '../development_process_section.dart';

class _ProcessPhaseCard extends StatefulWidget {
  final int index;
  final _ProcessPhase phase;
  final bool active;
  final VoidCallback onTap;

  const _ProcessPhaseCard({
    required this.index,
    required this.phase,
    required this.active,
    required this.onTap,
  });

  @override
  State<_ProcessPhaseCard> createState() => _ProcessPhaseCardState();
}

class _ProcessPhaseCardState extends State<_ProcessPhaseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final phase = widget.phase;
    final highlighted = widget.active || _hovered;
    return Semantics(
      button: true,
      selected: widget.active,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, highlighted ? -3 : 0, 0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: widget.active
                    ? phase.color.withValues(alpha: 0.9)
                    : highlighted
                        ? AppColors.border.withValues(alpha: 0.95)
                        : AppColors.border,
              ),
              boxShadow: widget.active
                  ? [
                      BoxShadow(
                        color: phase.color.withValues(alpha: 0.16),
                        blurRadius: 28,
                        offset: const Offset(0, 12),
                      ),
                    ]
                  : const [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surface2,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        (widget.index + 1).toString().padLeft(2, '0'),
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: phase.color.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(phase.icon, color: phase.color, size: 19),
                    ),
                    const Spacer(),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.surface2,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          'BRANCH ${widget.index + 1}  /  ${phase.branch}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                Text(
                  phase.title,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  phase.summary,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 15),
                Divider(
                  color: AppColors.border.withValues(alpha: 0.75),
                  height: 1,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 7,
                  runSpacing: 7,
                  children: [
                    for (final detail in phase.details)
                      _ProcessDetailChip(label: detail),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
