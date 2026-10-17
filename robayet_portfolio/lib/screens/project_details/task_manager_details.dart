part of '../project_details_screen.dart';

class _TaskManagerShowcase extends StatelessWidget {
  const _TaskManagerShowcase();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth.clamp(280.0, 960.0).toDouble();
          final compact = width < 520;
          final height = compact ? width / 1.42 : width / 2.32;
          final phoneWidth = (width * 0.18).clamp(78.0, 145.0).toDouble();
          final scale = (width / 510).clamp(0.68, 1.3).toDouble();

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: SizedBox(
                height: height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF111827),
                          Color(0xFF090B17),
                          Color(0xFF070612),
                        ],
                      ),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.38),
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.08),
                          blurRadius: 36,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, panel) => Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Positioned(
                            top: -85,
                            right: -28,
                            child: Container(
                              width: 210,
                              height: 170,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.accent.withValues(alpha: 0.1),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.accent
                                        .withValues(alpha: 0.16),
                                    blurRadius: 70,
                                    spreadRadius: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 13,
                            child: _TaskPreviewBadge(
                              label: 'Flutter App',
                              icon: Icons.phone_android_rounded,
                              color: AppColors.accent,
                              scale: scale,
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 13,
                            child: _TaskPreviewBadge(
                              label: 'Case Study',
                              icon: Icons.checklist_rounded,
                              color: AppColors.violet,
                              scale: scale,
                            ),
                          ),
                          Positioned(
                            top: 49,
                            left: compact ? 12 : 22,
                            right: phoneWidth - 13,
                            bottom: 12,
                            child: _TaskPreviewDashboard(scale: scale),
                          ),
                          Positioned(
                            top: 49,
                            right: compact ? 12 : 22,
                            bottom: 12,
                            width: phoneWidth,
                            child: _TaskPreviewPhone(scale: scale),
                          ),
                          Positioned(
                            left: compact ? 18 : 38,
                            bottom: 22,
                            width: (panel.maxWidth * 0.31)
                                .clamp(140.0, 290.0)
                                .toDouble(),
                            child: _TaskReminderToast(scale: scale),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}

class _TaskPreviewBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final double scale;

  const _TaskPreviewBadge({
    required this.label,
    required this.icon,
    required this.color,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12 * scale, vertical: 7 * scale),
        decoration: BoxDecoration(
          color: const Color(0xFF070A13).withValues(alpha: 0.86),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.46)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12 * scale, color: color),
            SizedBox(width: 5 * scale),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 9 * scale,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      );
}

class _TaskPreviewDashboard extends StatelessWidget {
  final double scale;

  const _TaskPreviewDashboard({required this.scale});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(11 * scale),
        decoration: BoxDecoration(
          color: const Color(0xFF101726).withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(13 * scale),
          border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.32),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.menu_book_rounded,
                    size: 13 * scale, color: AppColors.accent),
                SizedBox(width: 5 * scale),
                Text(
                  'TASK MANAGER',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 7 * scale,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.7,
                  ),
                ),
                const Spacer(),
                Icon(Icons.search_rounded,
                    size: 12 * scale, color: AppColors.muted),
                SizedBox(width: 7 * scale),
                Icon(Icons.tune_rounded,
                    size: 12 * scale, color: AppColors.muted),
              ],
            ),
            SizedBox(height: 9 * scale),
            Row(
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 12 * scale,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 6 * scale, vertical: 3 * scale),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '4 TOTAL',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 6 * scale,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6 * scale),
            Row(
              children: [
                _TaskPreviewFilter(label: 'All', selected: true, scale: scale),
                SizedBox(width: 5 * scale),
                _TaskPreviewFilter(label: 'Pending', scale: scale),
                SizedBox(width: 5 * scale),
                _TaskPreviewFilter(label: 'Done', scale: scale),
              ],
            ),
            SizedBox(height: 7 * scale),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _TaskPreviewRow(
                      title: 'Complete Flutter Assignment',
                      subtitle: 'Due Oct 05 - High priority',
                      scale: scale,
                    ),
                  ),
                  SizedBox(height: 5 * scale),
                  Expanded(
                    child: _TaskPreviewRow(
                      title: 'Review Firebase Docs',
                      subtitle: 'Due Oct 06 - Medium',
                      checked: true,
                      scale: scale,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TaskPreviewFilter extends StatelessWidget {
  final String label;
  final bool selected;
  final double scale;

  const _TaskPreviewFilter({
    required this.label,
    required this.scale,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.symmetric(horizontal: 8 * scale, vertical: 4 * scale),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.violet.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? AppColors.violet.withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.07),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColors.text : AppColors.muted,
            fontSize: 7 * scale,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}

class _TaskPreviewRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final double scale;
  final bool checked;

  const _TaskPreviewRow({
    required this.title,
    required this.subtitle,
    required this.scale,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.symmetric(horizontal: 8 * scale, vertical: 4 * scale),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(7 * scale),
          border: Border.all(color: Colors.white.withValues(alpha: 0.09)),
        ),
        child: Row(
          children: [
            Icon(
              checked ? Icons.check_circle_rounded : Icons.circle_outlined,
              size: 14 * scale,
              color: checked ? AppColors.success : AppColors.muted,
            ),
            SizedBox(width: 6 * scale),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: checked ? AppColors.muted : AppColors.text,
                      fontSize: 8 * scale,
                      fontWeight: FontWeight.w700,
                      decoration: checked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  SizedBox(height: 2 * scale),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: AppColors.muted, fontSize: 6 * scale),
                  ),
                ],
              ),
            ),
            Icon(Icons.more_horiz_rounded,
                size: 13 * scale, color: AppColors.muted),
          ],
        ),
      );
}

class _TaskPreviewPhone extends StatelessWidget {
  final double scale;

  const _TaskPreviewPhone({required this.scale});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(5 * scale),
        decoration: BoxDecoration(
          color: const Color(0xFF080C14),
          borderRadius: BorderRadius.circular(18 * scale),
          border: Border.all(color: Colors.white.withValues(alpha: 0.44)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13 * scale),
          child: ColoredBox(
            color: const Color(0xFFF4F6FA),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  7 * scale, 7 * scale, 7 * scale, 6 * scale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          color: const Color(0xFF1B2230),
                          fontSize: 6 * scale,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.wifi_rounded,
                          size: 8 * scale, color: Colors.black54),
                      SizedBox(width: 3 * scale),
                      Icon(Icons.battery_full_rounded,
                          size: 9 * scale, color: Colors.black54),
                    ],
                  ),
                  SizedBox(height: 7 * scale),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Tasks',
                          style: TextStyle(
                            color: const Color(0xFF1B2230),
                            fontSize: 10 * scale,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Icon(Icons.add_circle_rounded,
                          size: 14 * scale, color: AppColors.violet),
                    ],
                  ),
                  SizedBox(height: 3 * scale),
                  Text(
                    'Today - Monday',
                    style: TextStyle(
                        color: const Color(0xFF7B8290), fontSize: 6 * scale),
                  ),
                  SizedBox(height: 6 * scale),
                  _PhoneTaskPreview(
                    title: 'Complete Flutter Assignment',
                    color: const Color(0xFFDB456C),
                    scale: scale,
                  ),
                  SizedBox(height: 5 * scale),
                  _PhoneTaskPreview(
                    title: 'Review Firebase Docs',
                    color: const Color(0xFF46A783),
                    scale: scale,
                  ),
                  const Spacer(),
                  Container(height: 1, color: const Color(0xFFE0E3E9)),
                  SizedBox(height: 6 * scale),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.checklist_rounded,
                          size: 12 * scale, color: AppColors.violet),
                      Icon(Icons.calendar_month_rounded,
                          size: 12 * scale, color: const Color(0xFF858C99)),
                      Icon(Icons.settings_outlined,
                          size: 12 * scale, color: const Color(0xFF858C99)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _PhoneTaskPreview extends StatelessWidget {
  final String title;
  final Color color;
  final double scale;

  const _PhoneTaskPreview({
    required this.title,
    required this.color,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(5 * scale),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7 * scale),
          border: Border.all(color: const Color(0xFFE5E8EE)),
        ),
        child: Row(
          children: [
            Container(
              width: 3 * scale,
              height: 22 * scale,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(width: 5 * scale),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF272C35),
                      fontSize: 5.5 * scale,
                      height: 1.1,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3 * scale),
                  Text(
                    'Due today',
                    style: TextStyle(
                        color: const Color(0xFF858C99), fontSize: 5 * scale),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TaskReminderToast extends StatelessWidget {
  final double scale;

  const _TaskReminderToast({required this.scale});

  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.symmetric(horizontal: 9 * scale, vertical: 7 * scale),
        decoration: BoxDecoration(
          color: const Color(0xFF111A29).withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(11 * scale),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.48)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 27 * scale,
              height: 27 * scale,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(8 * scale),
              ),
              child: Icon(Icons.notifications_active_rounded,
                  color: AppColors.accent, size: 16 * scale),
            ),
            SizedBox(width: 8 * scale),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Task reminder',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 8 * scale,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 2 * scale),
                  Text(
                    'Local notification - just now',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.muted, fontSize: 6.5 * scale),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TaskManagerProjectDetailsContent extends StatelessWidget {
  const _TaskManagerProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DetailPanel(
            title: 'Project Overview',
            icon: Icons.description_outlined,
            child: Text(
              'Complete a Flutter task manager with account access, profile updates, task status tracking, and API-backed create, read, update, and delete operations.',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 13,
                height: 1.65,
              ),
            ),
          ),
          SizedBox(height: 16),
          _TaskManagerChallengePanel(),
          SizedBox(height: 16),
          _TaskManagerScreensPanel(),
          SizedBox(height: 16),
          _TaskManagerApiPanel(),
          SizedBox(height: 16),
          _TaskManagerStatesPanel(),
          SizedBox(height: 16),
          _TaskManagerExpectedPanel(),
        ],
      );
}

class _TaskManagerChallengePanel extends StatelessWidget {
  const _TaskManagerChallengePanel();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          const challenge = _ChallengeSolutionCard(
            title: 'The Challenge',
            color: Color(0xFFFF8199),
            text:
                'Keep sign-in, profile details, task records, and status summaries consistent while requests are in flight.',
            icon: Icons.flag_outlined,
          );
          const solution = _ChallengeSolutionCard(
            title: 'The Solution',
            color: AppColors.success,
            text:
                'Use a shared API layer, validate form input, and show clear loading, success, and error feedback on every request.',
            icon: Icons.check_circle_outline_rounded,
          );
          if (constraints.maxWidth < 560) {
            return const Column(
              children: [
                challenge,
                SizedBox(height: 12),
                solution,
              ],
            );
          }
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: challenge),
              SizedBox(width: 14),
              Expanded(child: solution),
            ],
          );
        },
      );
}

class _TaskManagerScreensPanel extends StatelessWidget {
  const _TaskManagerScreensPanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: 'Screens & User Flows',
        icon: Icons.phone_android_rounded,
        child: _BulletList(items: [
          'Show the book-and-pen logo on the splash screen.',
          'Provide Sign In, Forgot Password, and Registration flows.',
          'Registration collects email, first name, last name, mobile, and password.',
          'Show a dashboard with New, Completed, In Progress, and Cancelled counts.',
          'Add and edit tasks, update status, manage the profile, and log out.',
        ]),
      );
}

class _TaskManagerApiPanel extends StatelessWidget {
  const _TaskManagerApiPanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: 'API Integration & Task CRUD',
        icon: Icons.sync_alt_rounded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BulletList(items: [
              'Connect authentication, profile, and task operations to the supplied API contract.',
              'Load and display the signed-in user profile and task status summaries.',
              'Create, read, edit, delete, and update the status of task records.',
              'Send task title, description, and status; handle API responses safely.',
            ]),
            SizedBox(height: 13),
            Text(
              'TASK FIELDS',
              style: TextStyle(
                color: AppColors.accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 9),
            _ChipList(items: [
              'Title',
              'Description',
              'Status',
              'Created date',
            ]),
          ],
        ),
      );
}

class _TaskManagerStatesPanel extends StatelessWidget {
  const _TaskManagerStatesPanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: 'Request States & Validation',
        icon: Icons.rule_rounded,
        child: _BulletList(items: [
          'Show a loading state while each API request is in progress.',
          'Confirm successful sign-in, profile updates, and task changes.',
          'Show useful error feedback for invalid input, network failure, or API errors.',
          'Validate required fields and keep navigation responsive on small screens.',
        ]),
      );
}

class _TaskManagerExpectedPanel extends StatelessWidget {
  const _TaskManagerExpectedPanel();

  @override
  Widget build(BuildContext context) => const _DetailPanel(
        title: 'Expected Result',
        icon: Icons.emoji_events_outlined,
        child: _CheckGrid(items: [
          'Book-and-pen splash logo',
          'Sign In and Registration',
          'Profile update and logout',
          'Task create, list, edit, and delete',
          'Status dashboard and task filters',
          'API loading, success, and error states',
          'Working navigation and form validation',
        ]),
      );
}

class _TaskManagerFlowList extends StatelessWidget {
  const _TaskManagerFlowList();

  static const _items = [
    ('1', 'Sign in or register'),
    ('2', 'Load profile and task summary'),
    ('3', 'Create or update tasks through the API'),
    ('4', 'Refresh status counts and show request feedback'),
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
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.$2,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}
