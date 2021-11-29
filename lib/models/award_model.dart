class AwardModel {
  final String? title;
  final String? date;
  final String? awarder;

  AwardModel({
    this.title,
    this.date,
    this.awarder,
  });

  factory AwardModel.fromJson(Map<String, dynamic> json) {
    return AwardModel(
      title: json['title'] as String,
      date: json['date'] as String,
      awarder: json['awarder'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'awarder': awarder,
    };
  }

  @override
  String toString() {
    return 'AwardModel{title: $title, date: $date, awarder: $awarder}';
  }
}
