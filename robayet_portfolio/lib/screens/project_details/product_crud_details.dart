part of '../project_details_screen.dart';

class _ProductCrudShowcase extends StatelessWidget {
  const _ProductCrudShowcase();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth.clamp(280.0, 960.0).toDouble();
      final compact = width < 560;
      final height = compact ? width / 1.18 : width / 2.3;
      final phoneWidth = (width * 0.19).clamp(78.0, 180.0).toDouble();

      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: SizedBox(
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF17233D),
                      Color(0xFF101421),
                      Color(0xFF080B14),
                    ],
                  ),
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.4),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, panel) => Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Positioned(
                        top: -80,
                        right: -25,
                        child: Container(
                          width: 210,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accent.withValues(alpha: 0.1),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.17),
                                blurRadius: 70,
                                spreadRadius: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 12,
                        left: 13,
                        child: _CrudPreviewPill(
                          label: 'Flutter App',
                          icon: Icons.phone_android_rounded,
                          color: AppColors.accent,
                        ),
                      ),
                      const Positioned(
                        top: 12,
                        right: 13,
                        child: _CrudPreviewPill(
                          label: 'Case Study',
                          icon: Icons.inventory_2_rounded,
                          color: AppColors.violet,
                        ),
                      ),
                      Positioned(
                        top: 51,
                        left: compact ? 11 : 20,
                        right: phoneWidth - 10,
                        bottom: 12,
                        child: const _CrudProductListMock(),
                      ),
                      Positioned(
                        top: 51,
                        right: compact ? 11 : 22,
                        bottom: 12,
                        width: phoneWidth,
                        child: const _CrudEditPhoneMock(),
                      ),
                      if (!compact) ...[
                        Positioned(
                          left: panel.maxWidth * 0.34,
                          top: panel.maxHeight * 0.48,
                          width: (panel.maxWidth * 0.28)
                              .clamp(190.0, 270.0)
                              .toDouble(),
                          child: const _CrudDeleteDialogMock(),
                        ),
                        Positioned(
                          right: phoneWidth * 0.55,
                          bottom: 18,
                          width: (panel.maxWidth * 0.24)
                              .clamp(180.0, 230.0)
                              .toDouble(),
                          child: Transform.rotate(
                            angle: -0.12,
                            child: const _CrudAddPhoneMock(),
                          ),
                        ),
                      ] else
                        const Positioned(
                          left: 14,
                          bottom: 16,
                          child: _CrudDeleteToastMock(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _CrudPreviewPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _CrudPreviewPill({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFF080A14).withValues(alpha: 0.82),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: color.withValues(alpha: 0.42)),
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
  );
}

class _CrudProductListMock extends StatelessWidget {
  const _CrudProductListMock();

  static const _products = [
    ('Asus Laptop', 'Code: 9239923923  ·  Qty: 3', 'Unit: ৳70,000  ·  Total: ৳210,000'),
    ('Smart Watch', 'Code: 1787661903738  ·  Qty: 100', 'Unit: ৳15,000  ·  Total: ৳1,500,000'),
    ('Perfume', 'Code: 2311414  ·  Qty: 3', 'Unit: ৳345  ·  Total: ৳1,035'),
    ('Samsung S25', 'Code: 12345  ·  Qty: 5', 'Unit: ৳85,000  ·  Total: ৳425,000'),
  ];

  static const _colors = [
    Color(0xFF3E8FC7),
    Color(0xFF37B58F),
    Color(0xFFD4789B),
    Color(0xFF8C6AE1),
  ];

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(11, 8, 11, 8),
    decoration: BoxDecoration(
      color: const Color(0xFF101726).withValues(alpha: 0.97),
      borderRadius: BorderRadius.circular(13),
      border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: 22,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.inventory_2_rounded, size: 13, color: AppColors.accent),
            const SizedBox(width: 5),
            const Text(
              'PRODUCT INVENTORY',
              style: TextStyle(
                color: AppColors.muted,
                fontSize: 7,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.7,
              ),
            ),
            const Spacer(),
            Icon(Icons.search_rounded, size: 12, color: Colors.white.withValues(alpha: 0.7)),
            const SizedBox(width: 8),
            const Icon(Icons.tune_rounded, size: 12, color: AppColors.muted),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            const Text(
              'Product List',
              style: TextStyle(color: AppColors.text, fontSize: 12, fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.13),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '7 TOTAL',
                style: TextStyle(color: AppColors.accent, fontSize: 6, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Expanded(
          child: Column(
            children: [
              for (var index = 0; index < _products.length; index++) ...[
                if (index > 0) const SizedBox(height: 4),
                Expanded(
                  child: _CrudProductRow(
                    name: _products[index].$1,
                    details: _products[index].$2,
                    price: _products[index].$3,
                    color: _colors[index],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}

class _CrudProductRow extends StatelessWidget {
  final String name;
  final String details;
  final String price;
  final Color color;

  const _CrudProductRow({
    required this.name,
    required this.details,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.045),
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Colors.white.withValues(alpha: 0.09)),
    ),
    child: Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(Icons.shopping_bag_rounded, size: 14, color: color),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.text, fontSize: 8, fontWeight: FontWeight.w800)),
              const SizedBox(height: 2),
              Text(details, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.muted, fontSize: 6)),
              Text(price, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.muted, fontSize: 6)),
            ],
          ),
        ),
        const SizedBox(width: 5),
        const Icon(Icons.edit_rounded, size: 12, color: AppColors.accent),
        const SizedBox(width: 5),
        const Icon(Icons.delete_rounded, size: 12, color: Color(0xFFFF697B)),
      ],
    ),
  );
}

class _CrudEditPhoneMock extends StatelessWidget {
  const _CrudEditPhoneMock();

  @override
  Widget build(BuildContext context) => _CrudPhoneFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CrudStatusBar(),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(Icons.arrow_back_rounded, size: 11, color: Color(0xFF343343)),
            Expanded(
              child: Text('Edit Product', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF252536), fontSize: 9, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        const SizedBox(height: 7),
        const _CrudFormField(label: 'Product Name', value: 'Asus Laptop'),
        const SizedBox(height: 5),
        const _CrudFormField(label: 'Product Code', value: '9239923923'),
        const SizedBox(height: 5),
        const _CrudFormField(label: 'Image URL', value: 'https://image...'),
        const SizedBox(height: 5),
        const Row(
          children: [
            Expanded(child: _CrudFormField(label: 'Qty', value: '4')),
            SizedBox(width: 5),
            Expanded(child: _CrudFormField(label: 'Unit Price', value: '70000')),
          ],
        ),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(color: const Color(0xFFE9E7FA), borderRadius: BorderRadius.circular(5)),
          child: const Row(
            children: [
              Expanded(child: Text('Total Price', style: TextStyle(color: Color(0xFF464458), fontSize: 5.5))),
              Text('৳280,000', style: TextStyle(color: Color(0xFF242238), fontSize: 5.5, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: const Color(0xFFE8E6F3), borderRadius: BorderRadius.circular(12)),
          child: const Text('Save Changes', style: TextStyle(color: Color(0xFF514E6B), fontSize: 5.5, fontWeight: FontWeight.w700)),
        ),
      ],
    ),
  );
}

class _CrudAddPhoneMock extends StatelessWidget {
  const _CrudAddPhoneMock();

  @override
  Widget build(BuildContext context) => _CrudPhoneFrame(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CrudStatusBar(),
        const SizedBox(height: 6),
        const Row(
          children: [
            Icon(Icons.arrow_back_rounded, size: 10, color: Color(0xFF343343)),
            Expanded(
              child: Text('Add Product', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF252536), fontSize: 8, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const _CrudFormField(label: 'Product Name', value: 'Mercedes'),
        const SizedBox(height: 5),
        const _CrudFormField(label: 'Product Code', value: '2324'),
        const SizedBox(height: 5),
        const _CrudFormField(label: 'Image URL', value: 'https://image...'),
        const SizedBox(height: 5),
        const Row(
          children: [
            Expanded(child: _CrudFormField(label: 'Qty', value: '2')),
            SizedBox(width: 5),
            Expanded(child: _CrudFormField(label: 'Unit Price', value: '5000000')),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(color: const Color(0xFFE9E7FA), borderRadius: BorderRadius.circular(5)),
          child: const Row(
            children: [
              Expanded(child: Text('Total Price', style: TextStyle(color: Color(0xFF464458), fontSize: 5))),
              Text('৳10,000,000', style: TextStyle(color: Color(0xFF242238), fontSize: 5, fontWeight: FontWeight.w800)),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: const Color(0xFFE8E6F3), borderRadius: BorderRadius.circular(12)),
          child: const Text('Create Product', style: TextStyle(color: Color(0xFF514E6B), fontSize: 5.5, fontWeight: FontWeight.w700)),
        ),
      ],
    ),
  );
}

class _CrudPhoneFrame extends StatelessWidget {
  final Widget child;

  const _CrudPhoneFrame({required this.child});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: const Color(0xFF080C14),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.white.withValues(alpha: 0.42)),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.45), blurRadius: 20, offset: const Offset(0, 8)),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: ColoredBox(
        color: const Color(0xFFF6F5FB),
        child: Padding(padding: const EdgeInsets.all(8), child: child),
      ),
    ),
  );
}

class _CrudStatusBar extends StatelessWidget {
  const _CrudStatusBar();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Text('9:41', style: TextStyle(color: Color(0xFF252536), fontSize: 6, fontWeight: FontWeight.w800)),
      Spacer(),
      Icon(Icons.wifi_rounded, size: 8, color: Color(0xFF252536)),
      SizedBox(width: 3),
      Icon(Icons.battery_full_rounded, size: 9, color: Color(0xFF252536)),
    ],
  );
}

class _CrudFormField extends StatelessWidget {
  final String label;
  final String value;

  const _CrudFormField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: const Color(0xFFC8C6D2)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF747180), fontSize: 4.5)),
        const SizedBox(height: 2),
        Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF282637), fontSize: 6, fontWeight: FontWeight.w600)),
      ],
    ),
  );
}

class _CrudDeleteDialogMock extends StatelessWidget {
  const _CrudDeleteDialogMock();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
      color: const Color(0xFF171923).withValues(alpha: 0.96),
      borderRadius: BorderRadius.circular(13),
      border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 22, offset: const Offset(0, 8))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delete product?', style: TextStyle(color: AppColors.text, fontSize: 11, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('This will permanently delete “Mercedes”.', style: TextStyle(color: AppColors.muted, fontSize: 8, height: 1.4)),
        const SizedBox(height: 9),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Cancel', style: TextStyle(color: AppColors.muted, fontSize: 8, fontWeight: FontWeight.w700)),
            SizedBox(width: 12),
            Text('Delete', style: TextStyle(color: Color(0xFFFF697B), fontSize: 8, fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    ),
  );
}

class _CrudDeleteToastMock extends StatelessWidget {
  const _CrudDeleteToastMock();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      color: const Color(0xFF171923).withValues(alpha: 0.96),
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.35), blurRadius: 12, offset: const Offset(0, 4))],
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle_rounded, size: 12, color: AppColors.success),
        SizedBox(width: 6),
        Text('Product deleted', style: TextStyle(color: AppColors.text, fontSize: 8, fontWeight: FontWeight.w700)),
      ],
    ),
  );
}

class _ProductCrudProjectDetailsContent extends StatelessWidget {
  const _ProductCrudProjectDetailsContent();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _DetailPanel(
        title: 'Project Overview',
        icon: Icons.description_outlined,
        child: Text(
          'A Flutter product inventory app that reads product data from a REST API and lets users create, edit, and delete products. The interface keeps product totals visible and refreshes the list after successful changes.',
          style: TextStyle(color: AppColors.muted, fontSize: 13, height: 1.65),
        ),
      ),
      SizedBox(height: 16),
      _DetailPanel(
        title: 'Complete CRUD Operations',
        icon: Icons.sync_alt_rounded,
        child: _BulletList(items: [
          'GET: load and display products from the live API, with a manual refresh action.',
          'POST: validate and submit a new product, then refresh the list after success.',
          'PUT or PATCH: edit an existing product and show the updated values in the list.',
          'DELETE: confirm the action, remove the product, and show clear success or failure feedback.',
        ]),
      ),
      SizedBox(height: 16),
      _ProductCrudChallengePanel(),
      SizedBox(height: 16),
      _DetailPanel(
        title: 'Product Fields & Price Calculation',
        icon: Icons.calculate_outlined,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BulletList(items: [
              'Collect product name, product code, image URL, quantity, and unit price.',
              'Calculate total price from quantity multiplied by unit price and keep it updated as values change.',
              'Validate required values and numeric inputs before sending create or update requests.',
            ]),
            SizedBox(height: 8),
            _ChipList(items: ['Product Name', 'Product Code', 'Image URL', 'Quantity', 'Unit Price', 'Total Price']),
          ],
        ),
      ),
      SizedBox(height: 16),
      _DetailPanel(
        title: 'Loading, Errors & Refresh',
        icon: Icons.sync_rounded,
        child: _BulletList(items: [
          'Show loading feedback while products are fetched or saved.',
          'Handle network failures, invalid responses, and API validation errors with readable messages.',
          'Support pull-to-refresh and refresh product data after each successful create, update, or delete.',
          'Show a useful empty state when the API returns no products.',
        ]),
      ),
      SizedBox(height: 16),
      _DetailPanel(
        title: 'Expected Result',
        icon: Icons.checklist_rounded,
        child: _CheckGrid(items: [
          'Dynamic product list from the API',
          'Create and edit product forms',
          'Automatic total price',
          'Confirm before deleting',
          'Loading, error, and empty states',
          'Refresh after every successful mutation',
        ]),
      ),
    ],
  );
}

class _ProductCrudChallengePanel extends StatelessWidget {
  const _ProductCrudChallengePanel();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      const challenge = _ChallengeSolutionCard(
        title: 'The Challenge',
        color: Color(0xFFFF8199),
        text: 'Keep product data and calculated prices accurate while API requests can succeed, fail, or take time.',
        icon: Icons.flag_outlined,
      );
      const solution = _ChallengeSolutionCard(
        title: 'The Solution',
        color: AppColors.success,
        text: 'Use validated forms, explicit loading and error states, and refresh the product list after every successful write.',
        icon: Icons.check_circle_outline_rounded,
      );
      if (constraints.maxWidth < 560) {
        return const Column(
          children: [challenge, SizedBox(height: 12), solution],
        );
      }
      return const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: challenge), SizedBox(width: 14), Expanded(child: solution)],
      );
    },
  );
}

class _ProductCrudFlowList extends StatelessWidget {
  const _ProductCrudFlowList();

  static const _items = [
    ('1', 'GET product list from the API'),
    ('2', 'Create or edit with validated forms'),
    ('3', 'Confirm and delete a selected product'),
    ('4', 'Refresh data and report the result'),
  ];

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final item in _items)
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Row(
            children: [
              Container(
                width: 19,
                height: 19,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.violet.withValues(alpha: 0.13),
                  shape: BoxShape.circle,
                ),
                child: Text(item.$1, style: const TextStyle(color: Color(0xFFD39AFF), fontSize: 8, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(item.$2, style: const TextStyle(color: AppColors.muted, fontSize: 10, height: 1.4)),
              ),
            ],
          ),
        ),
    ],
  );
}
