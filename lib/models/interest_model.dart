class InterestsModel{
  final String? name;

  const InterestsModel({
    this.name,
  });

  factory InterestsModel.fromJson(Map<String, dynamic> json) => InterestsModel(
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
  };

  @override
  String toString() {
    return 'InterestsModel{name: $name}';
  }
}