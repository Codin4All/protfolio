part of '../project_details_screen.dart';

class _DetailPanel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _DetailPanel({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.78),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.9)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.accent, size: 18),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      );
}

class _ChallengeSolutionCard extends StatelessWidget {
  final String title;
  final Color color;
  final String text;
  final IconData icon;

  const _ChallengeSolutionCard({
    required this.title,
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 16),
                const SizedBox(width: 7),
                Text(
                  title,
                  style: TextStyle(
                      color: color, fontSize: 12, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.muted, fontSize: 11, height: 1.55),
            ),
          ],
        ),
      );
}

class _ChipList extends StatelessWidget {
  final List<String> items;
  const _ChipList({required this.items});

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 7,
        runSpacing: 7,
        children: [
          for (final item in items)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                item,
                style: const TextStyle(
                  color: Color(0xFFC7C7D5),
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      );
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 11.5,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ],
      );
}
