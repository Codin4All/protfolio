part of '../project_card.dart';

class _ProjectPreview extends StatelessWidget {
  final ProjectModel project;

  const _ProjectPreview({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.detailsKind == ProjectDetailsKind.languageLearning) {
      return const _LanguageLearningPreview();
    }
    if (project.detailsKind == ProjectDetailsKind.randomQuotes) {
      return const _RandomQuotePreview();
    }

    if (project.image.isNotEmpty) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final previewAspectRatio =
              constraints.maxWidth / constraints.maxHeight;
          final imageAspectRatio = project.imageAspectRatio;
          final fit = project.detailsKind == ProjectDetailsKind.flashcards ||
                  (imageAspectRatio != null &&
                      imageAspectRatio < previewAspectRatio)
              ? BoxFit.contain
              : BoxFit.cover;

          return Image.asset(
            project.image,
            fit: fit,
            alignment: Alignment.center,
          );
        },
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF17233D),
                Color(0xFF101421),
                Color(0xFF080B14),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          right: -20,
          child: Container(
            width: 150,
            height: 125,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accent.withValues(alpha: 0.11),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.2),
                  blurRadius: 52,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 45, 13, 11),
            child: switch (project.detailsKind) {
              ProjectDetailsKind.productCrud => const _ProductCrudPreview(),
              ProjectDetailsKind.providerCart => const _ProviderCartPreview(),
              _ => _TaskManagerPreview(project: project),
            },
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.36),
                  ],
                  stops: const [0, 0.48, 1],
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: 12,
          left: 13,
          child: _PreviewBadge(
            label: 'Flutter App',
            icon: Icons.phone_android_rounded,
          ),
        ),
        Positioned(
          top: 12,
          right: 13,
          child: _PreviewBadge(
            label: project.featured ? 'Featured' : 'Case Study',
            icon: project.featured
                ? Icons.star_rounded
                : Icons.checklist_rounded,
            color: project.featured ? AppColors.pink : AppColors.violet,
          ),
        ),
      ],
    );
  }
}

class _RandomQuotePreview extends StatelessWidget {
  const _RandomQuotePreview();

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF17233D), Color(0xFF101421), Color(0xFF080B14)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -55,
              right: -15,
              child: Container(
                width: 150,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withValues(alpha: 0.12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.18),
                      blurRadius: 48,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 12,
              left: 13,
              child: _PreviewBadge(
                label: 'Flutter App',
                icon: Icons.phone_android_rounded,
              ),
            ),
            const Positioned(
              top: 12,
              right: 13,
              child: _PreviewBadge(
                label: 'Case Study',
                icon: Icons.format_quote_rounded,
                color: AppColors.violet,
              ),
            ),
            Center(
              child: Container(
                width: 330,
                constraints: const BoxConstraints(maxWidth: 390),
                margin: const EdgeInsets.fromLTRB(24, 39, 24, 10),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                decoration: BoxDecoration(
                  color: const Color(0xFF111827).withValues(alpha: 0.94),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.22),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.format_quote_rounded,
                        color: AppColors.accent, size: 21),
                    SizedBox(height: 3),
                    Text(
                      'The only limit to our realization of tomorrow is our doubts of today.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 12,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '— Franklin D. Roosevelt',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.accentGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.refresh_rounded, size: 11, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'New Quote',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class _PreviewBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _PreviewBadge({
    required this.label,
    required this.icon,
    this.color = AppColors.accent,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF080A14).withValues(alpha: 0.76),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.34)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 12, color: color),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _TaskManagerPreview extends StatelessWidget {
  final ProjectModel project;

  const _TaskManagerPreview({required this.project});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final phoneWidth = constraints.maxWidth < 320 ? 68.0 : 78.0;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                right: phoneWidth - 10,
                child: _TaskDashboard(project: project),
              ),
              Positioned(
                right: 0,
                top: 1,
                bottom: 0,
                width: phoneWidth,
                child: const _TaskPhone(),
              ),
              Positioned(
                left: 12,
                bottom: 7,
                child: _NotificationToast(width: phoneWidth < 70 ? 138 : 158),
              ),
            ],
          );
        },
      );
}

class _ProviderCartPreview extends StatelessWidget {
  const _ProviderCartPreview();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final cartWidth = constraints.maxWidth < 320 ? 84.0 : 105.0;
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101726).withValues(alpha: 0.96),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shopping_bag_rounded,
                              size: 11, color: AppColors.accent),
                          const SizedBox(width: 5),
                          const Text(
                            'LOCAL PRODUCT LIST',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 6,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.55,
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.search_rounded,
                              size: 10,
                              color: Colors.white.withValues(alpha: 0.7)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text(
                            'Shop Products',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.13),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '6 ITEMS',
                              style: TextStyle(
                                color: AppColors.accent,
                                fontSize: 5,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Expanded(
                        child: Column(
                          children: [
                            _ProviderPreviewProduct(
                              name: 'Laptop',
                              price: '৳80,000',
                              icon: Icons.laptop_mac_rounded,
                              color: Color(0xFF58CDEB),
                            ),
                            SizedBox(height: 2),
                            _ProviderPreviewProduct(
                              name: 'Mobile Phone',
                              price: '৳25,000',
                              icon: Icons.phone_android_rounded,
                              color: Color(0xFF78A8FF),
                            ),
                            SizedBox(height: 2),
                            _ProviderPreviewProduct(
                              name: 'Headphones',
                              price: '৳3,000',
                              icon: Icons.headphones_rounded,
                              color: Color(0xFFB08AFF),
                            ),
                            SizedBox(height: 2),
                            _ProviderPreviewProduct(
                              name: 'Smart Watch',
                              price: '৳5,000',
                              icon: Icons.watch_rounded,
                              color: Color(0xFF45D4B0),
                            ),
                            SizedBox(height: 2),
                            _ProviderPreviewProduct(
                              name: 'Keyboard',
                              price: '৳2,000',
                              icon: Icons.keyboard_rounded,
                              color: Color(0xFFFFBA66),
                            ),
                            SizedBox(height: 2),
                            _ProviderPreviewProduct(
                              name: 'Mouse',
                              price: '৳1,000',
                              icon: Icons.mouse_rounded,
                              color: Color(0xFFFF7FAD),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: cartWidth,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4FA),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'My Cart',
                              style: TextStyle(
                                color: Color(0xFF20263A),
                                fontSize: 8,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            width: 14,
                            height: 14,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.violet,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const _ProviderCartMiniItem(
                          name: 'Headphones', quantity: '2'),
                      const SizedBox(height: 4),
                      const _ProviderCartMiniItem(name: 'Watch', quantity: '1'),
                      const Spacer(),
                      const Divider(height: 7, color: Color(0xFFDDE0EB)),
                      const _ProviderCartMiniTotal(
                          label: 'Subtotal', value: '৳11,000'),
                      const SizedBox(height: 2),
                      const _ProviderCartMiniTotal(
                          label: '10% discount', value: '− ৳1,100'),
                      const SizedBox(height: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE7E5FF),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'TOTAL  ৳9,900',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.violet,
                            fontSize: 6,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
}

class _ProviderPreviewProduct extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;
  final Color color;

  const _ProviderPreviewProduct({
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.045),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 11, color: color),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 6.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 5.5,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.add_circle_rounded, size: 10, color: color),
            ],
          ),
        ),
      );
}

class _ProviderCartMiniItem extends StatelessWidget {
  final String name;
  final String quantity;

  const _ProviderCartMiniItem({required this.name, required this.quantity});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.shopping_bag_outlined,
              size: 8, color: Color(0xFF687087)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color(0xFF30364A),
                  fontSize: 5.5,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Text('×$quantity',
              style: const TextStyle(
                  color: Color(0xFF687087),
                  fontSize: 5.5,
                  fontWeight: FontWeight.w700)),
        ],
      );
}

class _ProviderCartMiniTotal extends StatelessWidget {
  final String label;
  final String value;

  const _ProviderCartMiniTotal({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color(0xFF697084), fontSize: 5)),
          ),
          Text(value,
              style: const TextStyle(
                  color: Color(0xFF30364A),
                  fontSize: 5,
                  fontWeight: FontWeight.w700)),
        ],
      );
}

class _LanguageLearningPreview extends StatelessWidget {
  const _LanguageLearningPreview();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final quizWidth = constraints.maxWidth < 340 ? 94.0 : 118.0;
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101726).withValues(alpha: 0.96),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.translate_rounded,
                              size: 10, color: AppColors.accent),
                          const SizedBox(width: 4),
                          const Text(
                            'LINGUALEARN',
                            style: TextStyle(
                              color: AppColors.muted,
                              fontSize: 6,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.settings_outlined,
                              size: 9,
                              color: Colors.white.withValues(alpha: 0.7)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7259E8), Color(0xFF4D39BB)],
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Learn a little every day',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 7,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              '4 of 6 lessons complete',
                              style: TextStyle(
                                color: Color(0xFFDCD6FF),
                                fontSize: 5.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: const LinearProgressIndicator(
                                value: 0.66,
                                minHeight: 3,
                                backgroundColor: Color(0x664B3DB2),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF69E0C2)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text(
                            'Categories',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 7,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Spacer(),
                          _LanguageCategoryChip(label: 'Vocab', selected: true),
                          const SizedBox(width: 3),
                          _LanguageCategoryChip(label: 'Grammar'),
                          const SizedBox(width: 3),
                          _LanguageCategoryChip(label: 'Phrases'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Text(
                            'Daily Lessons',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 7,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Spacer(),
                          Text('3 lessons',
                              style: TextStyle(
                                  color: AppColors.muted, fontSize: 5.5)),
                        ],
                      ),
                      const SizedBox(height: 3),
                      const Expanded(
                        child: Column(
                          children: [
                            _LanguageLessonPreview(
                                title: 'How are you?',
                                translation: 'আপনি কেমন আছেন?'),
                            SizedBox(height: 2),
                            _LanguageLessonPreview(
                                title: 'Nice to meet you.',
                                translation: 'আপনার সাথে পরিচিত হয়ে ভালো লাগল'),
                            SizedBox(height: 2),
                            _LanguageLessonPreview(
                                title: 'Could you help me?',
                                translation: 'আপনি কি আমাকে সাহায্য করবেন?'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: quizWidth,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5FB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.arrow_back_rounded,
                              color: Color(0xFF555B70), size: 9),
                          SizedBox(width: 5),
                          Text(
                            'Quiz Practice',
                            style: TextStyle(
                              color: Color(0xFF24283A),
                              fontSize: 7,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      const Text('Question 3 of 5',
                          style: TextStyle(
                              color: Color(0xFF858A9A), fontSize: 5.5)),
                      const SizedBox(height: 4),
                      const Text(
                        'Past Simple',
                        style: TextStyle(
                          color: Color(0xFF24283A),
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Choose the correct translation',
                          maxLines: 2,
                          style: TextStyle(
                              color: Color(0xFF73798D), fontSize: 5)),
                      const SizedBox(height: 5),
                      const _LanguageAnswerOption(label: 'আমি বইটি পড়েছিলাম'),
                      const SizedBox(height: 3),
                      const _LanguageAnswerOption(
                          label: 'আমি বইটি পড়ছি', selected: true),
                      const SizedBox(height: 3),
                      const _LanguageAnswerOption(label: 'আমি বইটি পড়ব'),
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.violet,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Next Question',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 5.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
}

class _LanguageCategoryChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _LanguageCategoryChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.violet.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selected
                ? AppColors.violet.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFFD6C9FF) : AppColors.muted,
            fontSize: 5,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}

class _LanguageLessonPreview extends StatelessWidget {
  final String title;
  final String translation;

  const _LanguageLessonPreview({
    required this.title,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.045),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
          ),
          child: Row(
            children: [
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  color: AppColors.violet.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.volume_up_rounded,
                    color: AppColors.accent, size: 8),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 5.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      translation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 4.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.success, size: 8),
            ],
          ),
        ),
      );
}

class _LanguageAnswerOption extends StatelessWidget {
  final String label;
  final bool selected;

  const _LanguageAnswerOption({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFE8E4FF) : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selected ? AppColors.violet : const Color(0xFFE1E3EB),
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? AppColors.violet : const Color(0xFF555B70),
            fontSize: 5,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
