part of '../project_details_screen.dart';

class _ExampleMessage extends StatelessWidget {
  const _ExampleMessage();

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0D1A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EXAMPLE PUSH',
                style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8)),
            SizedBox(height: 7),
            Text('Title: New Task',
                style: TextStyle(
                    color: AppColors.text,
                    fontSize: 10,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 4),
            Text('Message: You have a new task: Complete Flutter Assignment',
                style: TextStyle(
                    color: AppColors.muted, fontSize: 10, height: 1.4)),
          ],
        ),
      );
}

class _NotificationSteps extends StatelessWidget {
  const _NotificationSteps();

  static const _steps = [
    'FCM notification arrives',
    'Flutter app receives the message',
    'App checks that it is in the foreground',
    'Read the notification data',
    'Create and show a local notification',
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (var index = 0; index < _steps.length; index++)
            Padding(
              padding:
                  EdgeInsets.only(bottom: index == _steps.length - 1 ? 0 : 5),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.violet.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Color(0xFFD39AFF),
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      _steps[index],
                      style: const TextStyle(
                          color: AppColors.muted, fontSize: 10, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}

class _LifecycleList extends StatelessWidget {
  const _LifecycleList();

  static const _items = [
    (
      'Foreground',
      'Receive the FCM message and display a local notification.',
      Icons.phone_android_rounded,
      AppColors.accent,
    ),
    (
      'Background',
      'Let Firebase display the notification normally.',
      Icons.pause_circle_outline_rounded,
      Color(0xFF9F83FF),
    ),
    (
      'Terminated',
      'Handle the notification when the user opens the app.',
      Icons.power_settings_new_rounded,
      Color(0xFFFFB65C),
    ),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (final item in _items)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(item.$3, size: 15, color: item.$4),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: AppColors.muted, fontSize: 10, height: 1.5),
                        children: [
                          TextSpan(
                            text: '${item.$1}: ',
                            style: TextStyle(
                              color: item.$4,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(text: item.$2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}

class _Callout extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Callout({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.16)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.accent, size: 15),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    color: AppColors.muted, fontSize: 10, height: 1.5),
              ),
            ),
          ],
        ),
      );
}
