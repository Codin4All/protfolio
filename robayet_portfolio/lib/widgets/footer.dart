import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';
import 'social_links.dart';

class Footer extends StatelessWidget {
  final ValueChanged<int> onSelect;

  const Footer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final year = DateTime.now().year;
    return SectionReveal(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          mobile ? 20 : 40,
          56,
          mobile ? 20 : 40,
          28,
        ),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1376),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 820) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _BrandColumn(),
                          const SizedBox(height: 34),
                          _QuickNavigation(onSelect: onSelect),
                          const SizedBox(height: 30),
                          const _DirectContact(),
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 5, child: _BrandColumn()),
                        const SizedBox(width: 48),
                        Expanded(
                          flex: 3,
                          child: _QuickNavigation(onSelect: onSelect),
                        ),
                        const SizedBox(width: 40),
                        const Expanded(flex: 4, child: _DirectContact()),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 44),
                Container(height: 1, color: AppColors.border.withValues(alpha: 0.6)),
                const SizedBox(height: 25),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final copyright = Text(
                      '© $year $ownerName. Built with Flutter & Dart.',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                    );
                    final availability = Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          availabilityBadge == 'Open to opportunities'
                              ? 'Available for new opportunities'
                              : availabilityBadge,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    );
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          copyright,
                          const SizedBox(height: 14),
                          availability,
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [copyright, availability],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  profileImage,
                  width: 46,
                  height: 46,
                  fit: BoxFit.cover,
                  semanticLabel: 'Portrait of $ownerName',
                ),
              ),
              const SizedBox(width: 13),
              Text(
                ownerName,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Computer Science & Engineering student building web, mobile, and embedded software with Flutter, Dart, and related technologies.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const SocialLinks(),
        ],
      );
}

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

class _DirectContact extends StatelessWidget {
  const _DirectContact();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FooterHeading('DIRECT CONTACT', color: AppColors.violet),
          const SizedBox(height: 14),
          _FooterContactItem(
            icon: Icons.mail_rounded,
            color: AppColors.violet,
            text: email,
            onTap: () => openLink('mailto:$email'),
          ),
          const SizedBox(height: 12),
          _FooterContactItem(
            icon: Icons.phone_rounded,
            color: AppColors.accent,
            text: phoneNumber,
            onTap: () => openLink(phoneUrl),
          ),
          const SizedBox(height: 12),
          _FooterContactItem(
            icon: Icons.location_on_rounded,
            color: AppColors.pink,
            text: contactLocation,
            onTap: () => openLink(
              'https://www.google.com/maps/search/?api=1&query='
              '${Uri.encodeComponent(contactLocation)}',
            ),
          ),
        ],
      );
}

class _FooterHeading extends StatelessWidget {
  final String label;
  final Color color;

  const _FooterHeading(this.label, {required this.color});

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.3,
        ),
      );
}

class _FooterContactItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  const _FooterContactItem({
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 17),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 15,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
