part of '../project_details_screen.dart';

class _NotificationFlowHero extends StatelessWidget {
  const _NotificationFlowHero();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          return Container(
            padding: EdgeInsets.all(compact ? 16 : 24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF101A2C), Color(0xFF0B0D1A)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.violet.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.notifications_active_rounded,
                        color: AppColors.accent, size: 17),
                    const SizedBox(width: 8),
                    Text(
                      'PUSH + LOCAL NOTIFICATION FLOW',
                      style: TextStyle(
                        color: AppColors.muted.withValues(alpha: 0.9),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: compact ? 16 : 22),
                if (compact)
                  const Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _FlowNode(
                              title: 'FCM message',
                              caption: 'Task data arrives',
                              icon: Icons.cloud_rounded,
                              color: Color(0xFFFFA64D)),
                          _FlowArrow(),
                          _FlowNode(
                              title: 'Flutter app',
                              caption: 'Check app state',
                              icon: Icons.phone_android_rounded,
                              color: Color(0xFF70A7FF)),
                          _FlowArrow(),
                          _FlowNode(
                              title: 'Local alert',
                              caption: 'Shown in foreground',
                              icon: Icons.notifications_active_rounded,
                              color: Color(0xFF52D4B0)),
                        ],
                      ),
                      SizedBox(height: 16),
                      _ForegroundMessageCard(),
                    ],
                  )
                else
                  const Row(
                    children: [
                      Expanded(
                        child: _FlowNode(
                            title: 'FCM message',
                            caption: 'Task data arrives',
                            icon: Icons.cloud_rounded,
                            color: Color(0xFFFFA64D)),
                      ),
                      _FlowArrow(),
                      Expanded(
                        child: _FlowNode(
                            title: 'Flutter app',
                            caption: 'Check app state',
                            icon: Icons.phone_android_rounded,
                            color: Color(0xFF70A7FF)),
                      ),
                      _FlowArrow(),
                      Expanded(
                        child: _FlowNode(
                            title: 'Local alert',
                            caption: 'Shown in foreground',
                            icon: Icons.notifications_active_rounded,
                            color: Color(0xFF52D4B0)),
                      ),
                      SizedBox(width: 12),
                      _ForegroundMessageCard(),
                    ],
                  ),
              ],
            ),
          );
        },
      );
}

class _FlowNode extends StatelessWidget {
  final String title;
  final String caption;
  final IconData icon;
  final Color color;

  const _FlowNode({
    required this.title,
    required this.caption,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(minWidth: 100),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.035),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              caption,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 8,
                height: 1.35,
              ),
            ),
          ],
        ),
      );
}

class _FlowArrow extends StatelessWidget {
  const _FlowArrow();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Icon(Icons.arrow_forward_rounded,
            color: AppColors.violet, size: 17),
      );
}
