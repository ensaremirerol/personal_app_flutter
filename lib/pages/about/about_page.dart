import 'package:flutter/material.dart';
import 'package:personal_site/models/award_model.dart';
import 'package:personal_site/models/certificate_model.dart';
import 'package:personal_site/models/education_model.dart';
import 'package:personal_site/models/interest_model.dart';
import 'package:personal_site/models/language_model.dart';
import 'package:personal_site/service/portfolio_service.dart';
import 'package:personal_site/utils/functions.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const String routeName = '/about';
  @override
  Widget build(BuildContext context) {
    final List<EducationModel> education =
        PortfolioService.of(context).portfolio.education;
    final List<CertificateModel> certificates =
        PortfolioService.of(context).portfolio.certificates;
    final List<AwardModel> awards =
        PortfolioService.of(context).portfolio.awards;
    final List<LanguageModel> languages =
        PortfolioService.of(context).portfolio.languages;
    final List<InterestsModel> interests =
        PortfolioService.of(context).portfolio.interests;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Education", style: Theme.of(context).textTheme.headline6),
        const Divider(),
        for (final EducationModel model in education)
          Card(
            child: ListTile(
              title: Text(model.institution!),
              subtitle: Text(
                  "${model.area!}\n${humanizeDateString(model.startDate)} - ${humanizeDateString(model.endDate)}"),
              isThreeLine: true,
            ),
          ),
        const Divider(),
        Text("Languages", style: Theme.of(context).textTheme.headline6),
        const Divider(),
        for (final LanguageModel model in languages)
          Card(
            child: ListTile(
              title: Text(model.language!),
              subtitle: Text(model.fluency!),
            ),
          ),
        const Divider(),
        Text(
          "Certificates",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Divider(),
        for (final CertificateModel model in certificates)
          Card(
            child: ListTile(
              isThreeLine: true,
              title: Text(model.name!),
              subtitle:
                  Text("${model.issuer}\n${humanizeDateString(model.date)}"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                if (!await launch(model.url ?? "")) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Could not open ${model.url}"),
                  ));
                }
              },
            ),
          ),
        const Divider(),
        Text(
          "Awards",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Divider(),
        for (final AwardModel model in awards)
          Card(
              child: ListTile(
            isThreeLine: true,
            title: Text(model.title!),
            subtitle:
                Text("${model.awarder}\n${humanizeDateString(model.date)}"),
          )),
        const Divider(),
        Text(
          "Interests",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Divider(),
        for (final InterestsModel model in interests)
          Card(
            child: ListTile(
              title: Text(model.name!),
            ),
          ),
      ]),
    );
  }
}
