part of '../project_card.dart';

class _ProductCrudPreview extends StatelessWidget {
  const _ProductCrudPreview();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final phoneWidth = constraints.maxWidth < 300 ? 66.0 : 78.0;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                right: phoneWidth - 9,
                child: const _ProductListMock(),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: phoneWidth,
                child: const _ProductEditPhoneMock(),
              ),
              Positioned(
                left: 10,
                bottom: 5,
                child: _ProductDeletedToast(width: phoneWidth < 70 ? 116 : 136),
              ),
            ],
          );
        },
      );
}

class _ProductListMock extends StatelessWidget {
  const _ProductListMock();

  static const _products = [
    (
      'Asus Laptop',
      'Code: 9239923923  ·  Qty: 3',
      '৳70,000  ·  Total: ৳210,000'
    ),
    (
      'Smart Watch',
      'Code: 1787661903738  ·  Qty: 100',
      '৳15,000  ·  Total: ৳1,500,000'
    ),
    ('Perfume', 'Code: 2311414  ·  Qty: 3', '৳345  ·  Total: ৳1,035'),
    ('Samsung S25', 'Code: 12345  ·  Qty: 5', '৳85,000  ·  Total: ৳425,000'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
        decoration: BoxDecoration(
          color: const Color(0xFF101726).withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.32),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.inventory_2_rounded,
                    size: 11, color: AppColors.accent),
                const SizedBox(width: 4),
                const Text(
                  'PRODUCT INVENTORY',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 5.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.55,
                  ),
                ),
                const Spacer(),
                Icon(Icons.search_rounded,
                    size: 10, color: Colors.white.withValues(alpha: 0.72)),
                const SizedBox(width: 5),
                const Icon(Icons.refresh_rounded,
                    size: 10, color: AppColors.accent),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  'Product List',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '7 PRODUCTS',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 4.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Column(
                children: [
                  for (var index = 0; index < _products.length; index++) ...[
                    if (index > 0) const SizedBox(height: 3),
                    Expanded(
                      child: _ProductMiniRow(
                        name: _products[index].$1,
                        detail: _products[index].$2,
                        price: _products[index].$3,
                        color: _productColors[index],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );

  static const _productColors = [
    Color(0xFF3A6FB2),
    Color(0xFF25A582),
    Color(0xFFC46B8D),
    Color(0xFF7046A6),
  ];
}

class _ProductMiniRow extends StatelessWidget {
  final String name;
  final String detail;
  final String price;
  final Color color;

  const _ProductMiniRow({
    required this.name,
    required this.detail,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.045),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Row(
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.shopping_bag_rounded, size: 10, color: color),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 5.8,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    detail,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: AppColors.muted, fontSize: 4.5),
                  ),
                  Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: AppColors.muted, fontSize: 4.5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 3),
            const Icon(Icons.edit_rounded, size: 8, color: AppColors.accent),
            const SizedBox(width: 3),
            const Icon(Icons.delete_rounded, size: 8, color: Color(0xFFFF697B)),
          ],
        ),
      );
}

class _ProductEditPhoneMock extends StatelessWidget {
  const _ProductEditPhoneMock();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFF080C14),
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.44),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: ColoredBox(
            color: const Color(0xFFF6F5FB),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text('9:41',
                          style: TextStyle(
                              color: Color(0xFF252536),
                              fontSize: 4.5,
                              fontWeight: FontWeight.w800)),
                      Spacer(),
                      Icon(Icons.wifi_rounded,
                          size: 6, color: Color(0xFF252536)),
                      SizedBox(width: 2),
                      Icon(Icons.battery_full_rounded,
                          size: 7, color: Color(0xFF252536)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Icon(Icons.arrow_back_rounded,
                          size: 8, color: Color(0xFF343343)),
                      Expanded(
                        child: Text(
                          'Edit Product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF252536),
                              fontSize: 6,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const _ProductFormField(
                      label: 'Product Name', value: 'Asus Laptop'),
                  const SizedBox(height: 3),
                  const _ProductFormField(
                      label: 'Product Code', value: '9239923923'),
                  const SizedBox(height: 3),
                  const _ProductFormField(
                      label: 'Image URL', value: 'https://image...'),
                  const SizedBox(height: 3),
                  const Row(
                    children: [
                      Expanded(
                          child: _ProductFormField(label: 'Qty', value: '4')),
                      SizedBox(width: 3),
                      Expanded(
                          child: _ProductFormField(
                              label: 'Unit Price', value: '70000')),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9E7FA),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                            child: Text('Total Price',
                                style: TextStyle(
                                    color: Color(0xFF464458), fontSize: 4.5))),
                        Text('৳280000',
                            style: TextStyle(
                                color: Color(0xFF242238),
                                fontSize: 4.5,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8E6F3),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Text('Save Changes',
                        style: TextStyle(
                            color: Color(0xFF514E6B),
                            fontSize: 4.5,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _ProductFormField extends StatelessWidget {
  final String label;
  final String value;

  const _ProductFormField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: const Color(0xFFC8C6D2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style:
                    const TextStyle(color: Color(0xFF747180), fontSize: 3.6)),
            const SizedBox(height: 1),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Color(0xFF282637),
                  fontSize: 4.6,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
}

class _ProductDeletedToast extends StatelessWidget {
  final double width;

  const _ProductDeletedToast({required this.width});

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFF191923).withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.32),
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.check_circle_rounded, size: 9, color: AppColors.success),
            SizedBox(width: 5),
            Text('Product deleted',
                style: TextStyle(
                    color: AppColors.text,
                    fontSize: 5.2,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      );
}
