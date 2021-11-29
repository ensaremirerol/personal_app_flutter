import 'package:personal_site/models/award_model.dart';
import 'package:personal_site/models/basics_model.dart';
import 'package:personal_site/models/certificate_model.dart';
import 'package:personal_site/models/education_model.dart';
import 'package:personal_site/models/interest_model.dart';
import 'package:personal_site/models/language_model.dart';
import 'package:personal_site/models/project_model.dart';
import 'package:personal_site/models/skills_model.dart';

class PortfolioModel {
  final BasicsModel basics;
  final List<SkillModel> skills;
  final List<ProjectModel> projects;
  final List<LanguageModel> languages;
  final List<EducationModel> education;
  final List<InterestsModel> interests;
  final List<AwardModel> awards;
  final List<CertificateModel> certificates;

  PortfolioModel(
      {required this.basics,
      required this.skills,
      required this.projects,
      required this.languages,
      required this.education,
      required this.interests,
      required this.awards,
      required this.certificates});

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      basics: BasicsModel.fromJson(json['basics']),
      skills:
          (json['skills'] as List).map((e) => SkillModel.fromJson(e)).toList(),
      projects: (json['projects'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList(),
      languages: (json['languages'] as List)
          .map((e) => LanguageModel.fromJson(e))
          .toList(),
      education: (json['education'] as List)
          .map((e) => EducationModel.fromJson(e))
          .toList(),
      interests: (json['interests'] as List)
          .map((e) => InterestsModel.fromJson(e))
          .toList(),
      awards:
          (json['awards'] as List).map((e) => AwardModel.fromJson(e)).toList(),
      certificates: (json['certificates'] as List)
          .map((e) => CertificateModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'basics': basics.toJson(),
      'skills': skills.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
      'languages': languages.map((e) => e.toJson()).toList(),
      'education': education.map((e) => e.toJson()).toList(),
      'interests': interests.map((e) => e.toJson()).toList(),
      'awards': awards.map((e) => e.toJson()).toList(),
      'certificates': certificates.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'PortfolioModel{basics: $basics, skills: $skills, projects: $projects, languages: $languages, education: $education, interests: $interests, awards: $awards, certificates: $certificates}';
  }
}
