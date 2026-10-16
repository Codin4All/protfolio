class ProjectModel {
  final String name;
  final String description;
  final List<String> technologies;
  final String image; // asset path
  final String githubUrl; // leave '' until the real repo link is known
  final String liveUrl; // leave '' if there is no live demo

  const ProjectModel({
    required this.name,
    required this.description,
    required this.technologies,
    required this.image,
    this.githubUrl = '',
    this.liveUrl = '',
  });
}
