import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_theme.dart';
import 'skills_section.dart' show SkillChip;
import 'social_links.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hover ? -5 : 0, 0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: _hover ? AppColors.accent : AppColors.border),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: AppColors.violet.withValues(alpha: 0.12),
                    blurRadius: 26,
                    offset: const Offset(0, 12),
                  ),
                ]
              : const [],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: AnimatedScale(
              scale: _hover ? 1.035 : 1,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
              child: Image.asset(
                p.image,
                fit: BoxFit.cover,
                // Shown until you add the real screenshot to assets/images/.
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.surface2,
                  child: const Center(
                      child: Icon(Icons.image_outlined,
                          size: 40, color: AppColors.muted)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Text(p.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.muted, height: 1.55)),
              const SizedBox(height: 16),
              Wrap(spacing: 8, runSpacing: 8, children: [
                for (final t in p.technologies) SkillChip(label: t),
              ]),
              const SizedBox(height: 20),
              Wrap(spacing: 10, runSpacing: 10, children: [
                OutlinedButton(
                  // Disabled until a real GitHub link is added in portfolio_data.dart.
                  onPressed:
                      p.githubUrl.isEmpty ? null : () => openLink(p.githubUrl),
                  child: const Text('GitHub'),
                ),
                if (p.liveUrl.isNotEmpty)
                  FilledButton(
                      onPressed: () => openLink(p.liveUrl),
                      child: const Text('Live Demo')),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
