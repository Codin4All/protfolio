part of '../footer.dart';

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
