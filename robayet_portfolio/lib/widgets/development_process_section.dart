import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class DevelopmentProcessSection extends StatefulWidget {
  const DevelopmentProcessSection({super.key});

  @override
  State<DevelopmentProcessSection> createState() =>
      _DevelopmentProcessSectionState();
}

class _DevelopmentProcessSectionState extends State<DevelopmentProcessSection> {
  bool _expanded = false;
  int? _activePhase;

  void _toggleExpanded() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Engineering & Development Process',
      eyebrow: 'WORKFLOW TREE • 4 BRANCHES',
      subtitle:
          'A clean 4-branch engineering roadmap designed to build scalable, resilient software from concept to production.',
      background: AppColors.bg,
      eyebrowPill: true,
      showHeadingAccent: false,
      gradientTitle: false,
      ambientGlow: AppColors.violet,
      child: Column(
        children: [
          Center(
            child: _ProcessRootControl(
              expanded: _expanded,
              onTap: _toggleExpanded,
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(sizeFactor: animation, child: child),
            ),
            child: _expanded
                ? const SizedBox.shrink(key: ValueKey('expanded-hint'))
                : Padding(
                    key: const ValueKey('collapsed-hint'),
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Click down arrow to view 4-branch tree',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.accent.withValues(alpha: 0.72),
                        fontSize: 11,
                        fontFamily: 'monospace',
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: _expanded
                ? Padding(
                    padding: const EdgeInsets.only(top: 38),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return constraints.maxWidth < 760
                          ? _MobileProcessTimeline(
                              activePhase: _activePhase,
                              onSelect: (index) =>
                                  setState(() => _activePhase = index),
                            )
                          : _DesktopProcessTimeline(
                              activePhase: _activePhase,
                              onSelect: (index) =>
                                  setState(() => _activePhase = index),
                            );
                    }),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

const _phases = [
  _ProcessPhase(
    title: 'Plan & Architect',
    branch: 'BLUEPRINT',
    summary: 'Requirements, system architecture, and database design',
    icon: Icons.account_tree_rounded,
    color: Color(0xFF3488FF),
    details: [
      'Requirements',
      'System Architecture',
      'Database Schema',
    ],
  ),
  _ProcessPhase(
    title: 'Design & Prototype',
    branch: 'DESIGN',
    summary: 'User flows, interface layouts, and responsive experiences',
    icon: Icons.design_services_rounded,
    color: AppColors.violet,
    details: [
      'User Flows',
      'Interface Layouts',
      'Responsive UX',
    ],
  ),
  _ProcessPhase(
    title: 'Code & Build',
    branch: 'BUILD',
    summary: 'Implement features, connect services, and refine the code',
    icon: Icons.code_rounded,
    color: AppColors.accent,
    details: [
      'C / C++',
      'Flutter / Kotlin / Java',
      'REST API & Firebase',
    ],
  ),
  _ProcessPhase(
    title: 'Deploy & Improve',
    branch: 'LAUNCH',
    summary: 'Prepare releases, deploy applications, and review performance',
    icon: Icons.rocket_launch_rounded,
    color: Color(0xFFFF7547),
    details: [
      'Build & Release',
      'Application Deployment',
      'Performance Review',
    ],
  ),
];

class _ProcessPhase {
  final String title;
  final String branch;
  final String summary;
  final IconData icon;
  final Color color;
  final List<String> details;

  const _ProcessPhase({
    required this.title,
    required this.branch,
    required this.summary,
    required this.icon,
    required this.color,
    required this.details,
  });
}

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
                SizedBox(width: veryNarrow ? 5 : compact ? 8 : 13),
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
                SizedBox(width: veryNarrow ? 5 : compact ? 8 : 13),
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
                    colors: [AppColors.violet, AppColors.accent, AppColors.pink],
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
                if (index != _phases.length - 1)
                  const SizedBox(height: 42),
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
                if (index != _phases.length - 1)
                  const SizedBox(height: 22),
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
            transform:
                Matrix4.translationValues(0, highlighted ? -3 : 0, 0),
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

class _ProcessDetailChip extends StatelessWidget {
  final String label;
  const _ProcessDetailChip({required this.label});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      );
}
