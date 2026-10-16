import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

Future<void> openLink(String url) async {
  if (url.isEmpty) return;
  await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 10, runSpacing: 10, children: [
      for (final s in socialLinks)
        Tooltip(
          message: s.label,
          child: _SocialLinkButton(link: s),
        ),
    ]);
  }
}

class _SocialLinkButton extends StatefulWidget {
  final SocialLink link;
  const _SocialLinkButton({required this.link});

  @override
  State<_SocialLinkButton> createState() => _SocialLinkButtonState();
}

class _SocialLinkButtonState extends State<_SocialLinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final link = widget.link;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.08 : 1,
        duration: const Duration(milliseconds: 180),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => openLink(link.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _hovered ? AppColors.surface2 : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: _hovered ? AppColors.accent : AppColors.border),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        blurRadius: 16,
                      ),
                    ]
                  : const [],
            ),
            child: Icon(link.icon,
                size: 22, color: _hovered ? AppColors.accent : AppColors.muted),
          ),
        ),
      ),
    );
  }
}
