part of '../project_card.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
        height: 458,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.86),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.62)
                : AppColors.border.withValues(alpha: 0.84),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.violet.withValues(alpha: 0.12),
                    blurRadius: 26,
                    offset: const Offset(0, 12),
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 188, child: _ProjectPreview(project: project)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.25,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12.5,
                        height: 1.45,
                      ),
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        for (final technology in project.technologies.take(3))
                          _TechTag(label: technology),
                        if (project.technologies.length > 3)
                          _TechTag(
                            label: '+${project.technologies.length - 3}',
                            subtle: true,
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Divider(
                      height: 1,
                      color: AppColors.border.withValues(alpha: 0.72),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _openProjectDetails(context, project),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.info_outline_rounded,
                                      size: 15, color: AppColors.muted),
                                  const SizedBox(width: 7),
                                  Flexible(
                                    child: Text(
                                      'Project overview',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: _hovered
                                            ? AppColors.text
                                            : AppColors.muted,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (project.githubUrl.isNotEmpty)
                          IconButton(
                            tooltip: 'Open GitHub repository',
                            visualDensity: VisualDensity.compact,
                            onPressed: () => openLink(project.githubUrl),
                            icon: const Icon(Icons.code_rounded, size: 18),
                            color: AppColors.muted,
                          ),
                        if (project.liveUrl.isNotEmpty)
                          TextButton.icon(
                            onPressed: () => openLink(project.liveUrl),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.accent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              visualDensity: VisualDensity.compact,
                              textStyle: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            icon:
                                const Icon(Icons.open_in_new_rounded, size: 13),
                            label: const Text('Live Demo'),
                          )
                        else
                          TextButton.icon(
                            onPressed: () =>
                                _openProjectDetails(context, project),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.violet,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              visualDensity: VisualDensity.compact,
                              textStyle: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            icon: const Icon(Icons.arrow_forward_rounded,
                                size: 14),
                            label: const Text('Details'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openProjectDetails(BuildContext context, ProjectModel project) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ProjectDetailsScreen(project: project),
      ),
    );
  }
}
