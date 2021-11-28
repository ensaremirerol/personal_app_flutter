class SkillModel {
  final String name;
  final String level;
  final int rating;

  SkillModel({required this.name, required this.level, required this.rating});

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      level: json['level'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'rating': rating,
    };
  }
}
