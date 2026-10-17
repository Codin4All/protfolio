part of '../project_card.dart';

class _TaskPhone extends StatelessWidget {
  const _TaskPhone();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(5, 7, 5, 5),
        decoration: BoxDecoration(
          color: const Color(0xFF080C14),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.white.withValues(alpha: 0.36)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.46),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6FA),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                        color: Color(0xFF1B2230),
                        fontSize: 5,
                        fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Icon(Icons.wifi_rounded,
                      size: 7, color: Colors.black.withValues(alpha: 0.7)),
                  const SizedBox(width: 2),
                  Icon(Icons.battery_full_rounded,
                      size: 8, color: Colors.black.withValues(alpha: 0.7)),
                ],
              ),
              const SizedBox(height: 4),
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Tasks',
                      style: TextStyle(
                          color: Color(0xFF1B2230),
                          fontSize: 8,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Icon(Icons.add_circle_rounded,
                      size: 11, color: AppColors.violet),
                ],
              ),
              const SizedBox(height: 2),
              const Text(
                'Today - Monday',
                style: TextStyle(color: Color(0xFF7B8290), fontSize: 5),
              ),
              const SizedBox(height: 3),
              const _PhoneTaskCard(
                title: 'Complete Flutter Assignment',
                color: Color(0xFFDB456C),
              ),
              const SizedBox(height: 3),
              const _PhoneTaskCard(
                title: 'Review Firebase Docs',
                color: Color(0xFF46A783),
              ),
              const Spacer(),
              Container(
                height: 1,
                color: const Color(0xFFE0E3E9),
              ),
              const SizedBox(height: 3),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.checklist_rounded,
                      size: 9, color: AppColors.violet),
                  Icon(Icons.calendar_month_rounded,
                      size: 9, color: Color(0xFF858C99)),
                  Icon(Icons.settings_outlined,
                      size: 9, color: Color(0xFF858C99)),
                ],
              ),
            ],
          ),
        ),
      );
}
