part of '../contact_section.dart';

extension _ContactPanelBuilder on _ContactSectionState {
  Widget _buildContactPanel() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's discuss your vision",
              style: TextStyle(
                color: AppColors.text,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Building a web platform, mobile app, or software project? Let's build it together.",
              style: TextStyle(
                color: AppColors.muted,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 22),
            _ContactInfoCard(
              label: 'EMAIL ADDRESS',
              value: email,
              icon: Icons.mail_rounded,
              color: AppColors.violet,
              onTap: () => openLink('mailto:$email'),
              onCopy: () => _copy(email),
            ),
            const SizedBox(height: 14),
            _ContactInfoCard(
              label: 'PHONE NUMBER',
              value: phoneNumber,
              icon: Icons.phone_rounded,
              color: const Color(0xFF5598FF),
              onTap: () => openLink(phoneUrl),
              onCopy: () => _copy(phoneNumber),
            ),
            const SizedBox(height: 14),
            _ContactInfoCard(
              label: 'LOCATION',
              value: contactLocation,
              icon: Icons.location_on_rounded,
              color: AppColors.pink,
              onTap: () => openLink(
                'https://www.google.com/maps/search/?api=1&query='
                '${Uri.encodeComponent(contactLocation)}',
              ),
              trailingIcon: Icons.open_in_new_rounded,
            ),
          ],
        ),
      );
}
