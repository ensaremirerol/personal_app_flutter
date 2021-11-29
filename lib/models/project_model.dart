class ProjectModel {
  final String name;
  final String description;
  final List<String> languages;
  final String githubUrl;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.languages,
    required this.githubUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] as String,
      description: json['description'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      githubUrl: json['githubUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'languages': languages,
      'githubUrl': githubUrl,
    };
  }

  @override
  String toString() {
    return 'ProjectModel{name: $name, description: $description, languages: $languages, githubUrl: $githubUrl}';
  }
}
