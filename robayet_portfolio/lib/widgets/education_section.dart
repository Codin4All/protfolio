import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Education',
      eyebrow: 'ACADEMIC BACKGROUND',
      background: AppColors.surface.withValues(alpha: 0.5),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Timeline marker
          Column(children: [
            Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 26),
                decoration: const BoxDecoration(
                    color: AppColors.accent, shape: BoxShape.circle)),
            Expanded(child: Container(width: 2, color: AppColors.border)),
          ]),
          const SizedBox(width: 20),
          const Expanded(
            child: AppCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(degree,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    SizedBox(height: 8),
                    Text(university,
                        style:
                            TextStyle(fontSize: 16, color: AppColors.accent)),
                    SizedBox(height: 6),
                    Row(children: [
                      Icon(Icons.location_on_outlined,
                          size: 16, color: AppColors.muted),
                      SizedBox(width: 6),
                      Text(universityLocation,
                          style: TextStyle(color: AppColors.muted)),
                    ]),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
