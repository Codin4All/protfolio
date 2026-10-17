part of '../project_details_screen.dart';

class _ProjectReview {
  final String name;
  final String comment;
  final int rating;

  const _ProjectReview({
    required this.name,
    required this.comment,
    required this.rating,
  });
}

class _ReviewCard extends StatelessWidget {
  final _ProjectReview review;
  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.violet.withValues(alpha: 0.18),
                  child: Text(
                    review.name.isEmpty ? '?' : review.name[0].toUpperCase(),
                    style: const TextStyle(
                        color: Color(0xFFD09BFF),
                        fontSize: 11,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(review.name,
                      style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 11,
                          fontWeight: FontWeight.w800)),
                ),
                for (var i = 0; i < review.rating; i++)
                  const Icon(Icons.star_rounded,
                      size: 12, color: Color(0xFFFFC247)),
              ],
            ),
            const SizedBox(height: 10),
            Text(review.comment,
                style: const TextStyle(
                    color: AppColors.muted, fontSize: 11, height: 1.5)),
          ],
        ),
      );
}
