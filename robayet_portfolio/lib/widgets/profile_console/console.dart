part of '../profile_console.dart';

class ProfileConsole extends StatelessWidget {
  const ProfileConsole({super.key});

  @override
  Widget build(BuildContext context) {
    final focusAreas = skillGroups.entries.take(4).toList();
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF151327), Color(0xFF0C0B19)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.violet.withValues(alpha: 0.12),
            blurRadius: 44,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ConsoleBar(),
          _IdentityCard(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'CORE FOCUS',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'LEARNING • BUILDING',
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                LayoutBuilder(builder: (context, constraints) {
                  final columns = constraints.maxWidth < 400 ? 1 : 2;
                  final gap = 10.0;
                  final itemWidth =
                      (constraints.maxWidth - gap * (columns - 1)) / columns;
                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: [
                      for (var i = 0; i < focusAreas.length; i++)
                        SizedBox(
                          width: itemWidth,
                          child: _ExpertiseCard(
                            title: focusAreas[i].key,
                            detail: focusAreas[i].value.take(2).join(' • '),
                            icon: _focusIcons[i],
                            color: _focusColors[i],
                          ),
                        ),
                    ],
                  );
                }),
                const SizedBox(height: 14),
                LayoutBuilder(builder: (context, constraints) {
                  final gap = 8.0;
                  final width = (constraints.maxWidth - gap * 2) / 3;
                  return Row(
                    children: [
                      SizedBox(
                        width: width,
                        child: _MetricCard(
                          value: projects.length.toString().padLeft(2, '0'),
                          label: 'Projects',
                          color: AppColors.accent,
                        ),
                      ),
                      SizedBox(width: gap),
                      SizedBox(
                        width: width,
                        child: _MetricCard(
                          value: skillGroups.length.toString().padLeft(2, '0'),
                          label: 'Skill groups',
                          color: AppColors.success,
                        ),
                      ),
                      SizedBox(width: gap),
                      SizedBox(
                        width: width,
                        child: const _MetricCard(
                          value: 'Dhaka',
                          label: 'Based in',
                          color: AppColors.violet,
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            decoration: const BoxDecoration(
              color: Color(0xFF090815),
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: const Row(
              children: [
                _LiveDot(),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Building with Flutter & Dart',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(Icons.terminal_rounded, size: 16, color: AppColors.accent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const _focusIcons = [
  Icons.phone_android_rounded,
  Icons.cloud_outlined,
  Icons.storage_rounded,
  Icons.code_rounded,
];

const _focusColors = [
  AppColors.accent,
  AppColors.violet,
  AppColors.pink,
  AppColors.success,
];
