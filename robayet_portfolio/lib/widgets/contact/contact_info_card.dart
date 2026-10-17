part of '../contact_section.dart';

class _ContactInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? onCopy;
  final IconData? trailingIcon;

  const _ContactInfoCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.onTap,
    this.onCopy,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: Container(
            constraints: const BoxConstraints(minHeight: 78),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(13),
              border:
                  Border.all(color: AppColors.border.withValues(alpha: 0.8)),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 21),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onCopy != null)
                  IconButton(
                    tooltip: 'Copy $label',
                    onPressed: onCopy,
                    icon: const Icon(Icons.content_copy_rounded, size: 18),
                    color: AppColors.muted,
                    visualDensity: VisualDensity.compact,
                  )
                else if (trailingIcon != null)
                  Icon(trailingIcon, color: AppColors.muted, size: 18),
              ],
            ),
          ),
        ),
      );
}
