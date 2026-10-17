part of '../projects_section.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  static const _filters = [
    'All Projects',
    'Featured',
    'Mobile Apps',
    'Firebase',
    'Notifications',
    'API Integration',
    'CRUD Operations',
  ];

  String _selectedFilter = _filters.first;

  List<ProjectModel> get _visibleProjects {
    if (_selectedFilter == 'All Projects') return projects;
    if (_selectedFilter == 'Featured') {
      return projects.where((project) => project.featured).toList();
    }
    return projects
        .where((project) => project.categories.contains(_selectedFilter))
        .toList();
  }

  int _countFor(String filter) {
    if (filter == 'All Projects') return projects.length;
    if (filter == 'Featured') {
      return projects.where((project) => project.featured).length;
    }
    return projects
        .where((project) => project.categories.contains(filter))
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Featured Projects & Case Studies',
      titleWidget: _ProjectsHeading(mobile: isMobile(context)),
      eyebrow: 'PORTFOLIO SHOWCASE',
      subtitle:
          'Flutter mobile projects covering task management, Firebase notifications, and complete REST API product workflows.',
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 9,
            runSpacing: 10,
            children: [
              for (final filter in _filters)
                _ProjectFilterChip(
                  label: filter,
                  count: _countFor(filter),
                  selected: _selectedFilter == filter,
                  onTap: () => setState(() => _selectedFilter = filter),
                ),
            ],
          ),
          const SizedBox(height: 34),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 320),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: LayoutBuilder(
              key: ValueKey(_selectedFilter),
              builder: (context, constraints) {
                final cardWidth = gridItemWidth(
                  constraints.maxWidth,
                  maxCols: 3,
                  minItem: 290,
                  gap: 20,
                );
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (final project in _visibleProjects)
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(
                          key: ValueKey(project.name),
                          project: project,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
