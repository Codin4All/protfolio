part of '../project_details_screen.dart';

class _DetailsGridPainter extends CustomPainter {
  const _DetailsGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.12)
      ..strokeWidth = 0.6;
    const spacing = 88.0;
    for (var x = 0.0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DetailsGridPainter oldDelegate) => false;
}
