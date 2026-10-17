part of '../navbar.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<int> onSelect;
  const Navbar({super.key, required this.onSelect});

  static const _primaryLinks = [
    _NavLink('About', 1),
    _NavLink('Education', 4),
    _NavLink('Skills', 2),
    _NavLink('Projects', 3),
    _NavLink('Certificates', 5),
    _NavLink('Contact', 6),
  ];

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 1180;
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: AppColors.bg.withValues(alpha: 0.94),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1528),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width < 600 ? 18 : 32),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => onSelect(0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          gradient: AppColors.accentGradient,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            profileImage,
                            width: 42,
                            height: 42,
                            fit: BoxFit.cover,
                            semanticLabel: 'Portrait of $ownerName',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              width < 600 ? ownerShortName : ownerName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const _StatusDot(size: 9),
                          ]),
                          if (width >= 600)
                            Text(
                              '$ownerTitle | $ownerSubtitle',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!compact) ...[
                  for (final link in _primaryLinks)
                    TextButton(
                      onPressed: () => onSelect(link.section),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.muted,
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                      ),
                      child: Text(
                        link.label,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  const SizedBox(width: 12),
                ],
                if (width >= 480)
                  GradientButton(
                    label: 'Hire Me',
                    icon: Icons.rocket_launch_rounded,
                    height: 44,
                    onPressed: () => onSelect(6),
                  ),
                if (compact) ...[
                  const SizedBox(width: 10),
                  Builder(
                    builder: (ctx) => IconButton(
                      tooltip: 'Open navigation menu',
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
