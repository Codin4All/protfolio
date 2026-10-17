part of '../navbar.dart';

class _StatusDot extends StatelessWidget {
  final double size;
  const _StatusDot({required this.size});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.success.withValues(alpha: 0.45),
              blurRadius: 10,
            ),
          ],
        ),
      );
}
