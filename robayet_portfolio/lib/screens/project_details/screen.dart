part of '../project_details_screen.dart';

const _figmaUrl =
    'https://www.figma.com/design/H7AJlTItYcXu96WEIwrqeF/Flutter-Firebase?node-id=0-1&t=vI6Dxnu2kfncNNqz-0';

class ProjectDetailsScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final List<_ProjectReview> _reviews = [];
  BuildContext? _reviewsContext;

  double get _averageRating {
    if (_reviews.isEmpty) return 0;
    return _reviews.fold<double>(0, (total, review) => total + review.rating) /
        _reviews.length;
  }

  Future<void> _writeReview() async {
    final review = await showDialog<_ProjectReview>(
      context: context,
      builder: (_) => const _WriteReviewDialog(),
    );
    if (review == null || !mounted) return;
    setState(() => _reviews.insert(0, review));
  }

  void _scrollToReviews() {
    final targetContext = _reviewsContext;
    if (targetContext == null) return;
    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 760;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _DetailsGridPainter()),
            ),
          ),
          Positioned(
            top: -220,
            left: 0,
            right: 0,
            height: 550,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, 0.4),
                    radius: 0.9,
                    colors: [
                      AppColors.violet.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1220),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: mobile ? 18 : 32,
                    vertical: mobile ? 20 : 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _PageTopBar(onBack: () => Navigator.of(context).pop()),
                      SizedBox(height: mobile ? 26 : 38),
                      _ProjectHero(project: widget.project),
                      SizedBox(height: mobile ? 26 : 34),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wide = constraints.maxWidth >= 900;
                          final main = _MainProjectDetails(
                            project: widget.project,
                          );
                          final side = _ProjectSidebar(
                            project: widget.project,
                            reviewCount: _reviews.length,
                            onWriteReview: _writeReview,
                            onReadReviews: _scrollToReviews,
                          );
                          if (!wide) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                main,
                                const SizedBox(height: 18),
                                side,
                              ],
                            );
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 7, child: main),
                              const SizedBox(width: 24),
                              Expanded(flex: 3, child: side),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: mobile ? 26 : 38),
                      Builder(
                        builder: (context) {
                          _reviewsContext = context;
                          return _ReviewsSection(
                            reviews: _reviews,
                            averageRating: _averageRating,
                            projectName: widget.project.name,
                            onWriteReview: _writeReview,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          '${widget.project.name.toUpperCase()} · PROJECT BRIEF',
                          style: TextStyle(
                            color: AppColors.muted.withValues(alpha: 0.65),
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
