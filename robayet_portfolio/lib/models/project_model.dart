enum ProjectDetailsKind {
  firebaseNotifications,
  taskManager,
  productCrud,
  contactManagement,
  notes,
}

class ProjectModel {
  final String name;
  final String description;
  final List<String> technologies;
  final List<String> categories;
  final bool featured;
  final String image;
  final double? imageAspectRatio;
  final String githubUrl; // leave '' until the real repo link is known
  final String liveUrl; // leave '' if there is no live demo
  final ProjectDetailsKind detailsKind;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.technologies,
    required this.categories,
    this.featured = false,
    this.image = '',
    this.imageAspectRatio,
    this.githubUrl = '',
    this.liveUrl = '',
    this.detailsKind = ProjectDetailsKind.firebaseNotifications,
  });
}
