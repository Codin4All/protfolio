part of '../footer.dart';

class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  profileImage,
                  width: 46,
                  height: 46,
                  fit: BoxFit.cover,
                  semanticLabel: 'Portrait of $ownerName',
                ),
              ),
              const SizedBox(width: 13),
              Text(
                ownerName,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Computer Science & Engineering student building web, mobile, and embedded software with Flutter, Dart, and related technologies.',
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const SocialLinks(),
        ],
      );
}
