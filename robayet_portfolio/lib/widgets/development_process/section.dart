part of '../development_process_section.dart';

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
