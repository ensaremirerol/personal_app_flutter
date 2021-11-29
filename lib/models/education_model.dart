class EducationModel {
  final String? institution;
  final String? area;
  final String? startDate;
  final String? endDate;
  final String? description;
  final String? gpa;

  EducationModel({
    this.institution,
    this.area,
    this.startDate,
    this.endDate,
    this.description,
    this.gpa,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        institution: json["institution"],
        area: json["area"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        description: json["description"],
        gpa: json["gpa"],
      );

  Map<String, dynamic> toJson() => {
        "institution": institution,
        "area": area,
        "startDate": startDate,
        "endDate": endDate,
        "description": description,
        "gpa": gpa,
      };

  @override
  String toString() {
    return 'EducationModel{institution: $institution, area: $area, startDate: $startDate, endDate: $endDate, description: $description, gpa: $gpa}';
  }
}
