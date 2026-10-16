import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'project_card.dart';
import 'section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Projects',
      eyebrow: 'SELECTED WORK',
      subtitle: 'Selected work built with Flutter, Java and MySQL.',
      background: AppColors.surface.withValues(alpha: 0.5),
      child: LayoutBuilder(builder: (context, c) {
        final w = gridItemWidth(c.maxWidth, maxCols: 3, minItem: 320);
        return Wrap(spacing: 20, runSpacing: 20, children: [
          for (final p in projects)
            SizedBox(width: w, child: ProjectCard(project: p)),
        ]);
      }),
    );
  }
}
