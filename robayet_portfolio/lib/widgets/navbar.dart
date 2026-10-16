import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'gradient_button.dart';

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
                              width < 600
                                  ? ownerShortName
                                  : ownerName,
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

class NavDrawer extends StatelessWidget {
  final ValueChanged<int> onSelect;
  const NavDrawer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(profileImage,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      semanticLabel: 'Portrait of $ownerName'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ownerName,
                        style: const TextStyle(fontWeight: FontWeight.w800)),
                    Text(ownerTitle,
                        style: const TextStyle(
                            color: AppColors.accent, fontSize: 12)),
                  ],
                ),
              ]),
            ),
            for (var i = 0; i < navItems.length; i++)
              ListTile(
                leading: Icon(_sectionIcons[i], size: 20),
                title: Text(navItems[i],
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onTap: () {
                  Navigator.pop(context);
                  onSelect(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}

const _sectionIcons = [
  Icons.home_outlined,
  Icons.person_outline_rounded,
  Icons.auto_awesome_mosaic_outlined,
  Icons.code_rounded,
  Icons.school_outlined,
  Icons.workspace_premium_outlined,
  Icons.mail_outline_rounded,
];

class _NavLink {
  final String label;
  final int section;
  const _NavLink(this.label, this.section);
}

class _StatusDot extends StatelessWidget {
  final double size;
  const _StatusDot({required this.size});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.success.withValues(alpha: 0.45),
              blurRadius: 10,
            ),
          ],
        ),
      );
}
