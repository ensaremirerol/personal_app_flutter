class LanguageModel {
  final String? language;
  final String? fluency;

  LanguageModel({this.language, this.fluency});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      language: json['language'],
      fluency: json['fluency'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['fluency'] = this.fluency;
    return data;
  }

  @override
  String toString() {
    return 'LanguageModel{language: $language, fluency: $fluency}';
  }
}