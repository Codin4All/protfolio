part of '../navbar.dart';

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
