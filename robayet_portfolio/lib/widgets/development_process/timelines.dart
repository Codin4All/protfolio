part of '../development_process_section.dart';

class _DesktopProcessTimeline extends StatelessWidget {
  final int? activePhase;
  final ValueChanged<int> onSelect;

  const _DesktopProcessTimeline({
    required this.activePhase,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                width: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.violet,
                      AppColors.accent,
                      AppColors.pink
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              for (var index = 0; index < _phases.length; index++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: index.isEven
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: _ProcessPhaseCard(
                                index: index,
                                phase: _phases[index],
                                active: activePhase == index,
                                onTap: () => onSelect(index),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(width: 26),
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: _AnimatedProcessDot(
                          active: activePhase == index,
                          size: 17,
                        ),
                      ),
                    ),
                    const SizedBox(width: 26),
                    Expanded(
                      child: index.isOdd
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: _ProcessPhaseCard(
                                index: index,
                                phase: _phases[index],
                                active: activePhase == index,
                                onTap: () => onSelect(index),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
                if (index != _phases.length - 1) const SizedBox(height: 42),
              ],
            ],
          ),
        ],
      );
}

class _MobileProcessTimeline extends StatelessWidget {
  final int? activePhase;
  final ValueChanged<int> onSelect;

  const _MobileProcessTimeline({
    required this.activePhase,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 10,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.violet, AppColors.accent, AppColors.pink],
                ),
              ),
            ),
          ),
          Column(
            children: [
              for (var index = 0; index < _phases.length; index++) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 22,
                      child: Center(
                        child: _AnimatedProcessDot(
                          active: activePhase == index,
                          size: 17,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _ProcessPhaseCard(
                        index: index,
                        phase: _phases[index],
                        active: activePhase == index,
                        onTap: () => onSelect(index),
                      ),
                    ),
                  ],
                ),
                if (index != _phases.length - 1) const SizedBox(height: 22),
              ],
            ],
          ),
        ],
      );
}

class _AnimatedProcessDot extends StatelessWidget {
  final bool active;
  final double size;

  const _AnimatedProcessDot({required this.active, required this.size});

  @override
  Widget build(BuildContext context) => AnimatedScale(
        scale: active ? 1.18 : 1,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: active ? AppColors.accent : AppColors.bg,
            shape: BoxShape.circle,
            border: Border.all(
              color: active
                  ? Colors.white
                  : AppColors.muted.withValues(alpha: 0.65),
              width: active ? 2.5 : 2,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.75),
                      blurRadius: 16,
                      spreadRadius: 3,
                    ),
                  ]
                : const [],
          ),
        ),
      );
}
