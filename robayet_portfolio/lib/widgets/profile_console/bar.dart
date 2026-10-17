part of '../profile_console.dart';

class _ConsoleBar extends StatelessWidget {
  const _ConsoleBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      decoration: const BoxDecoration(
        color: Color(0xFF0C0B19),
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          const _WindowDot(color: Color(0xFFEC4265)),
          const SizedBox(width: 8),
          const _WindowDot(color: Color(0xFFF1A422)),
          const SizedBox(width: 8),
          const _WindowDot(color: Color(0xFF18B982)),
          const SizedBox(width: 14),
          const Icon(Icons.chevron_right_rounded,
              size: 17, color: AppColors.muted),
          const Text(
            'robayet.dev',
            style: TextStyle(
              color: AppColors.muted,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: AppColors.success.withValues(alpha: 0.24)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LiveDot(),
                SizedBox(width: 6),
                Text(
                  'AVAILABLE',
                  style: TextStyle(
                    color: AppColors.success,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
