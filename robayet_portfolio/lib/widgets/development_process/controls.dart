part of '../development_process_section.dart';

class _ProcessRootControl extends StatelessWidget {
  final bool expanded;
  final VoidCallback onTap;

  const _ProcessRootControl({required this.expanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 560;
    final veryNarrow = width < 380;
    return Semantics(
      button: true,
      expanded: expanded,
      label: 'System lifecycle, four key phases',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 12 : 20,
              vertical: 11,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.accent.withValues(
                  alpha: expanded ? 0.75 : 0.38,
                ),
              ),
              boxShadow: expanded
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : const [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _RootStatusDot(),
                const SizedBox(width: 9),
                Text(
                  veryNarrow ? 'ROOT' : 'ROOT:',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: compact ? 11 : 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                    fontFamily: 'monospace',
                  ),
                ),
                SizedBox(
                    width: veryNarrow
                        ? 5
                        : compact
                            ? 8
                            : 13),
                Text(
                  veryNarrow
                      ? 'SYSTEM'
                      : compact
                          ? 'LIFECYCLE'
                          : 'SYSTEM LIFECYCLE',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: compact ? 11 : 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                    fontFamily: 'monospace',
                  ),
                ),
                if (!compact) ...[
                  const SizedBox(width: 13),
                  Container(width: 1, height: 17, color: AppColors.border),
                ],
                SizedBox(
                    width: veryNarrow
                        ? 5
                        : compact
                            ? 8
                            : 13),
                Text(
                  compact ? '4 PHASES' : '4 KEY PHASES',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: compact ? 10 : 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                    fontFamily: 'monospace',
                  ),
                ),
                SizedBox(width: compact ? 6 : 10),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 280),
                  child: Container(
                    width: compact ? 24 : 28,
                    height: compact ? 24 : 28,
                    decoration: BoxDecoration(
                      color: AppColors.surface2,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.accent,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RootStatusDot extends StatelessWidget {
  const _RootStatusDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppColors.accent.withValues(alpha: 0.72),
              AppColors.accent.withValues(alpha: 0.18),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withValues(alpha: 0.28),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
      );
}
