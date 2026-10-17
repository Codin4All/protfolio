part of '../footer.dart';

class Footer extends StatelessWidget {
  final ValueChanged<int> onSelect;

  const Footer({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final year = DateTime.now().year;
    return SectionReveal(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          mobile ? 20 : 40,
          56,
          mobile ? 20 : 40,
          28,
        ),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1376),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 820) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _BrandColumn(),
                          const SizedBox(height: 34),
                          _QuickNavigation(onSelect: onSelect),
                          const SizedBox(height: 30),
                          const _DirectContact(),
                        ],
                      );
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 5, child: _BrandColumn()),
                        const SizedBox(width: 48),
                        Expanded(
                          flex: 3,
                          child: _QuickNavigation(onSelect: onSelect),
                        ),
                        const SizedBox(width: 40),
                        const Expanded(flex: 4, child: _DirectContact()),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 44),
                Container(
                    height: 1, color: AppColors.border.withValues(alpha: 0.6)),
                const SizedBox(height: 25),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final copyright = Text(
                      '© $year $ownerName. Built with Flutter & Dart.',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                    );
                    final availability = Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          availabilityBadge == 'Open to opportunities'
                              ? 'Available for new opportunities'
                              : availabilityBadge,
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    );
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          copyright,
                          const SizedBox(height: 14),
                          availability,
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [copyright, availability],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
