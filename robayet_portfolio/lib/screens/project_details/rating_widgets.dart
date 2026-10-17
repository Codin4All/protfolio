part of '../project_details_screen.dart';

class _RatingSummary extends StatelessWidget {
  final double average;
  final int count;
  const _RatingSummary({required this.average, required this.count});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                average.toStringAsFixed(1),
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 44,
                  height: 0.95,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, bottom: 5),
                child: Icon(Icons.star_rounded,
                    color: Color(0xFFFFC247), size: 22),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (var i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Icon(
                    Icons.star_rounded,
                    size: 13,
                    color: count > 0 && i < average.round()
                        ? const Color(0xFFFFC247)
                        : const Color(0xFF41445A),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            count == 0
                ? 'No reviews submitted yet'
                : '$count ${count == 1 ? 'review' : 'reviews'} submitted',
            style: const TextStyle(
                color: AppColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w600),
          ),
        ],
      );
}

class _RatingBar extends StatelessWidget {
  final int stars;
  final int count;
  final int total;

  const _RatingBar({
    required this.stars,
    required this.count,
    required this.total,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Text('$stars star',
                  style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 9,
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: total == 0 ? 0 : count / total,
                  minHeight: 6,
                  backgroundColor: AppColors.surface2,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFFFC247)),
                ),
              ),
            ),
            SizedBox(
              width: 28,
              child: Text(
                '$count',
                textAlign: TextAlign.right,
                style: const TextStyle(color: AppColors.muted, fontSize: 8),
              ),
            ),
          ],
        ),
      );
}

class _EmptyReviews extends StatelessWidget {
  final VoidCallback onWriteReview;
  const _EmptyReviews({required this.onWriteReview});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border.withValues(alpha: 0.78),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border),
              ),
              child: const Icon(Icons.chat_bubble_outline_rounded,
                  color: AppColors.muted, size: 18),
            ),
            const SizedBox(height: 12),
            const Text(
              'No reviews yet for this project',
              style: TextStyle(
                  color: AppColors.text,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              'Be the first to share an evaluation.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.muted, fontSize: 10),
            ),
            const SizedBox(height: 14),
            GradientButton(
              label: 'Write the First Review',
              icon: Icons.star_rounded,
              onPressed: onWriteReview,
              height: 38,
            ),
          ],
        ),
      );
}
