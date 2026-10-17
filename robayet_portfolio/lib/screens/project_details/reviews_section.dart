part of '../project_details_screen.dart';

class _ReviewsSection extends StatelessWidget {
  final List<_ProjectReview> reviews;
  final double averageRating;
  final String projectName;
  final VoidCallback onWriteReview;

  const _ReviewsSection({
    required this.reviews,
    required this.averageRating,
    required this.projectName,
    required this.onWriteReview,
  });

  int _countFor(int stars) =>
      reviews.where((review) => review.rating == stars).length;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.border),
                bottom: BorderSide(color: AppColors.border),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 560;
                final title = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.violet.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.violet.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        '${reviews.length} ${reviews.length == 1 ? 'Review' : 'Reviews'}',
                        style: const TextStyle(
                          color: Color(0xFFD09BFF),
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: AppColors.muted, fontSize: 12, height: 1.45),
                        children: [
                          const TextSpan(
                              text:
                                  'Real feedback and technical evaluation for '),
                          TextSpan(
                            text: projectName,
                            style: const TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
                final button = GradientButton(
                  label: 'Write a Review',
                  icon: Icons.star_rounded,
                  onPressed: onWriteReview,
                  height: 42,
                );
                if (compact) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [title, const SizedBox(height: 12), button],
                  );
                }
                return Row(
                  children: [
                    Expanded(child: title),
                    const SizedBox(width: 16),
                    button
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 590;
                final rating = _RatingSummary(
                  average: averageRating,
                  count: reviews.length,
                );
                final distribution = Column(
                  children: [
                    for (var stars = 5; stars >= 1; stars--)
                      _RatingBar(
                        stars: stars,
                        count: _countFor(stars),
                        total: reviews.length,
                      ),
                  ],
                );
                if (compact) {
                  return Column(
                    children: [
                      rating,
                      const SizedBox(height: 18),
                      distribution,
                    ],
                  );
                }
                return Row(
                  children: [
                    SizedBox(width: 185, child: rating),
                    Container(
                      width: 1,
                      height: 96,
                      margin: const EdgeInsets.symmetric(horizontal: 22),
                      color: AppColors.border,
                    ),
                    Expanded(child: distribution),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          if (reviews.isEmpty)
            _EmptyReviews(onWriteReview: onWriteReview)
          else
            for (final review in reviews) ...[
              _ReviewCard(review: review),
              const SizedBox(height: 10),
            ],
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Reviews submitted here are only kept while this page is open.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.muted, fontSize: 9),
            ),
          ),
        ],
      );
}
