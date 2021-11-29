import 'package:flutter/material.dart';
import 'package:personal_site/icons/programming_icons.dart';
import 'package:personal_site/models/skills_model.dart';
import 'package:personal_site/service/portfolio_service.dart';

class ProgrammingLanguagesWidget extends StatelessWidget {
  const ProgrammingLanguagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SkillModel> skills =
        PortfolioService.of(context).portfolio.skills;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final SkillModel skill in skills) _getChip(context, skill)
      ],
    );
  }

  Widget _getChip(BuildContext context, SkillModel skill) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        labelPadding: const EdgeInsets.all(4.0),
        avatar: Icon(getIcons(skill.name)),
        label: Text(skill.name),
      ),
    );
  }

  IconData? getIcons(String name) {
    switch (name) {
      case "Flutter | Dart":
        return ProgrammingIcons.flutter_plain;
      case "Python":
        return ProgrammingIcons.python_plain;
      case "JavaScript":
        return ProgrammingIcons.javascript_plain;
      case "Java":
        return ProgrammingIcons.java_plain;
      case "C/C++":
        return ProgrammingIcons.c_plain;
      case "C#":
        return ProgrammingIcons.csharp_plain;
      case "PHP":
        return ProgrammingIcons.php_plain;
      case "Ruby":
        return ProgrammingIcons.ruby_plain;
      case "Swift":
        return ProgrammingIcons.swift_plain;
      case "Kotlin":
        return ProgrammingIcons.kotlin_plain;
      case "Dart":
        return ProgrammingIcons.dart_plain;
      case "Go":
        return ProgrammingIcons.go_plain;
      case "Rust":
        return ProgrammingIcons.rust_plain;
      case "Django":
        return ProgrammingIcons.django_plain;
      case "Git":
        return ProgrammingIcons.git_plain;
      case "Linux":
        return ProgrammingIcons.linux_plain;
      case "HTML/CSS":
        return ProgrammingIcons.html5_plain;
    }
    return null;
  }
}
