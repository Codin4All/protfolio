part of '../project_details_screen.dart';

class _ProviderCartFlowHero extends StatelessWidget {
  const _ProviderCartFlowHero();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 760;
          final steps = [
            const _ProviderCartFlowNode(
              title: 'Local products',
              caption: 'Six or more items',
              icon: Icons.inventory_2_outlined,
              color: Color(0xFF63CDEE),
            ),
            const _ProviderCartFlowNode(
              title: 'CartProvider',
              caption: 'ChangeNotifier state',
              icon: Icons.account_tree_rounded,
              color: Color(0xFFB68AFF),
            ),
            const _ProviderCartFlowNode(
              title: 'Shopping cart',
              caption: 'Count and quantity update',
              icon: Icons.shopping_cart_outlined,
              color: Color(0xFF53D6B0),
            ),
            const _ProviderCartFlowNode(
              title: 'Cart summary',
              caption: '10% off above ৳2,000',
              icon: Icons.receipt_long_outlined,
              color: Color(0xFFFFBD68),
            ),
          ];

          return Container(
            padding: EdgeInsets.all(compact ? 16 : 22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF101A2C), Color(0xFF0B0D1A)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.violet.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.sync_alt_rounded,
                        color: AppColors.accent, size: 17),
                    SizedBox(width: 8),
                    Text(
                      'PROVIDER CART STATE FLOW',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: compact ? 14 : 20),
                if (compact)
                  Column(
                    children: [
                      for (var i = 0; i < steps.length; i++) ...[
                        steps[i],
                        if (i < steps.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Icon(Icons.south_rounded,
                                color: AppColors.violet, size: 16),
                          ),
                      ],
                    ],
                  )
                else
                  Row(
                    children: [
                      for (var i = 0; i < steps.length; i++) ...[
                        Expanded(child: steps[i]),
                        if (i < steps.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            child: Icon(Icons.arrow_forward_rounded,
                                color: AppColors.violet, size: 17),
                          ),
                      ],
                    ],
                  ),
              ],
            ),
          );
        },
      );
}

class _ProviderCartFlowNode extends StatelessWidget {
  final String title;
  final String caption;
  final IconData icon;
  final Color color;

  const _ProviderCartFlowNode({
    required this.title,
    required this.caption,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 94),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.035),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              caption,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 8,
                height: 1.35,
              ),
            ),
          ],
        ),
      );
}
