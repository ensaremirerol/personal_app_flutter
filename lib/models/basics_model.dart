import 'package:personal_site/models/profiles_model.dart';

class BasicsModel {
  final String? name;
  final String? label;
  final String? image;
  final String? summary;
  final List<ProfileModel>? profiles;

  BasicsModel({
    this.name,
    this.label,
    this.image,
    this.summary,
    this.profiles,
  });

  factory BasicsModel.fromJson(Map<String, dynamic> json) => BasicsModel(
        name: json["name"],
        label: json["label"],
        image: json["image"],
        summary: json["summary"],
        profiles: List<ProfileModel>.from(
            json["profiles"].map((x) => ProfileModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "image": image,
        "summary": summary,
        "profiles": profiles?.map((e) => e.toJson()).toList() ?? [],
      };

  @override
  String toString() {
    return 'BasicsModel{name: $name, label: $label, image: $image, summary: $summary, profiles: $profiles}';
  }
}
