part of '../project_details_screen.dart';

class _PageTopBar extends StatelessWidget {
  final VoidCallback onBack;
  const _PageTopBar({required this.onBack});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          OutlinedButton.icon(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_rounded, size: 16),
            label: const Text('Back to Portfolio'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.muted,
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Portfolio',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Icon(Icons.chevron_right_rounded,
                size: 15, color: AppColors.muted),
          ),
          const Text(
            'Mobile App',
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      );
}
