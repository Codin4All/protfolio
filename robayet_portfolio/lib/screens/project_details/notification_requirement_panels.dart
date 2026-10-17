part of '../project_details_screen.dart';

class _PushAndLocalNotificationPanels extends StatelessWidget {
  const _PushAndLocalNotificationPanels();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: '4. Firebase Push Notifications',
            icon: Icons.notifications_active_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BulletList(items: [
                  'Configure Firebase Cloud Messaging (FCM).',
                  'Get the device FCM token and handle incoming messages.',
                  'Send a test push notification to the device.',
                  'Include task information in the notification data.',
                ]),
                SizedBox(height: 12),
                _ExampleMessage(),
              ],
            ),
          ),
          SizedBox(height: 16),
          _DetailPanel(
            title: '5. Local Notifications',
            icon: Icons.notifications_none_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'When an FCM message arrives while the app is open, read its notification data and create a local notification. A package such as flutter_local_notifications can display the foreground alert.',
                  style: TextStyle(
                      color: AppColors.muted, fontSize: 12, height: 1.6),
                ),
                SizedBox(height: 14),
                _NotificationSteps(),
              ],
            ),
          ),
        ],
      );
}

class _NotificationStatePanel extends StatelessWidget {
  const _NotificationStatePanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: '6. App States & Notification Taps',
        icon: Icons.devices_other_rounded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LifecycleList(),
            SizedBox(height: 13),
            _Callout(
              icon: Icons.touch_app_outlined,
              text:
                  'When a notification is tapped, open the Task List. If possible, pass the task ID and navigate to that specific task.',
            ),
          ],
        ),
      );
}
