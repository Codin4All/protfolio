part of '../footer.dart';

class _QuickNavigation extends StatelessWidget {
  final ValueChanged<int> onSelect;

  const _QuickNavigation({required this.onSelect});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FooterHeading('QUICK NAVIGATION', color: AppColors.accent),
          const SizedBox(height: 14),
          for (final item in _footerLinks)
            _FooterNavItem(
              item: item,
              onTap: () => onSelect(item.section),
            ),
        ],
      );
}

const _footerLinks = [
  _FooterLink('Home', 0, Icons.home_rounded),
  _FooterLink('About', 1, Icons.person_rounded),
  _FooterLink('Education', 4, Icons.school_rounded),
  _FooterLink('Certificates', 5, Icons.workspace_premium_rounded),
  _FooterLink('Skills', 2, Icons.auto_awesome_mosaic_rounded),
  _FooterLink('Projects', 3, Icons.account_tree_rounded),
  _FooterLink('Contact', 6, Icons.send_rounded),
];

class _FooterLink {
  final String label;
  final int section;
  final IconData icon;

  const _FooterLink(this.label, this.section, this.icon);
}

class _FooterNavItem extends StatelessWidget {
  final _FooterLink item;
  final VoidCallback onTap;

  const _FooterNavItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    color: AppColors.surface2,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Icon(item.icon, color: AppColors.muted, size: 14),
                ),
                const SizedBox(width: 10),
                Text(
                  item.label,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
