part of '../project_details_screen.dart';

class _CheckGrid extends StatelessWidget {
  final List<String> items;
  const _CheckGrid({required this.items});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 520 ? 2 : 1;
          final width = (constraints.maxWidth - (columns - 1) * 12) / columns;
          return Wrap(
            spacing: 12,
            runSpacing: 10,
            children: [
              for (final item in items)
                SizedBox(
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_rounded,
                          color: Color(0xFFB57BFF), size: 14),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 10,
                            height: 1.45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      );
}

class _CompactFlowList extends StatelessWidget {
  const _CompactFlowList();

  static const _items = [
    ('1', 'FCM sends task data'),
    ('2', 'Foreground app shows local alert'),
    ('3', 'Tap opens Task List'),
    ('4', 'Task ID can open exact task'),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (final item in _items)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                children: [
                  Container(
                    width: 19,
                    height: 19,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.violet.withValues(alpha: 0.13),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      item.$1,
                      style: const TextStyle(
                          color: Color(0xFFD39AFF),
                          fontSize: 8,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.$2,
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
