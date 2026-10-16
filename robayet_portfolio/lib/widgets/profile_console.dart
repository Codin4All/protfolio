import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

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

class _ConsoleBar extends StatelessWidget {
  const _ConsoleBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      decoration: const BoxDecoration(
        color: Color(0xFF0C0B19),
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const _WindowDot(color: Color(0xFFEC4265)),
          const SizedBox(width: 8),
          const _WindowDot(color: Color(0xFFF1A422)),
          const SizedBox(width: 8),
          const _WindowDot(color: Color(0xFF18B982)),
          const SizedBox(width: 14),
          const Icon(Icons.chevron_right_rounded,
              size: 17, color: AppColors.muted),
          const Text(
            'robayet.dev',
            style: TextStyle(
              color: AppColors.muted,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: AppColors.success.withValues(alpha: 0.24)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LiveDot(),
                SizedBox(width: 6),
                Text(
                  'AVAILABLE',
                  style: TextStyle(
                    color: AppColors.success,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.025),
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.violet.withValues(alpha: 0.3),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                profileImage,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
                semanticLabel: 'Portrait of $ownerName',
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ownerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 3),
                Text(ownerTitle,
                    style:
                        const TextStyle(color: AppColors.muted, fontSize: 13)),
                const SizedBox(height: 6),
                Row(children: [
                  const Icon(Icons.location_on_rounded,
                      size: 14, color: AppColors.accent),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      aboutCards.firstWhere((item) => item[0] == 'Location')[1],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: AppColors.muted, fontSize: 12),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
            ),
            child: const Text(
              'CSE • BUBT',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpertiseCard extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;
  final Color color;

  const _ExpertiseCard({
    required this.title,
    required this.detail,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 82),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: Icon(icon, size: 17, color: color),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
          ]),
          const SizedBox(height: 8),
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _MetricCard({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.018),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.7)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value,
                style: TextStyle(
                    color: color,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'monospace')),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 9,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _WindowDot extends StatelessWidget {
  final Color color;
  const _WindowDot({required this.color});

  @override
  Widget build(BuildContext context) => Container(
        width: 9,
        height: 9,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

class _LiveDot extends StatelessWidget {
  const _LiveDot();

  @override
  Widget build(BuildContext context) => Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: AppColors.success.withValues(alpha: 0.45),
                blurRadius: 8),
          ],
        ),
      );
}
