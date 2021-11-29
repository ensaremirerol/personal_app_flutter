import 'package:flutter/material.dart';
import 'package:personal_site/models/project_model.dart';
import 'package:personal_site/service/portfolio_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  static const String routeName = '/projects';

  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projects =
        PortfolioService.of(context).portfolio.projects;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(projects[index].name),
                    subtitle: Text(projects[index].languages.join(", ")),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      if (!await launch(projects[index].githubUrl)) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Could not open link'),
                        ));
                      }
                    },
                  ),
                );
              },
              itemCount: projects.length),
        ),
        const Divider(),
        Card(
            child: ListTile(
                title: Text("Other Projects"),
                subtitle: Text("See my other projects on Github"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final String url = PortfolioService.of(context)
                      .portfolio
                      .basics
                      .profiles!
                      .firstWhere((element) =>
                          element.network!.toLowerCase().contains("github"))
                      .url!;
                  if (!await launch(url)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Could not open link'),
                    ));
                  }
                }))
      ],
    );
  }
}
