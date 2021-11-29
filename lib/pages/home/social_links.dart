import 'package:flutter/material.dart';
import 'package:personal_site/icons/programming_icons.dart';
import 'package:personal_site/models/profiles_model.dart';
import 'package:personal_site/service/portfolio_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProfileModel> profiles =
        PortfolioService.of(context).portfolio.basics.profiles ?? [];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final ProfileModel profile in profiles)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () async {
                if (!await launch(profile.url ?? "")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Could not launch ${profile.url}'),
                    ),
                  );
                }
              },
              child: Chip(
                labelPadding: const EdgeInsets.all(4.0),
                avatar: Icon(getIcons(profile.network ?? "")),
                label: Row(
                  children: [
                    Text("${profile.network} | ${profile.username}"),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  IconData? getIcons(String network) {
    switch (network) {
      case "GitHub":
        return ProgrammingIcons.github_original;
      case "LinkedIn":
        return ProgrammingIcons.linkedin_plain;
      case "Twitter":
        return ProgrammingIcons.twitter_original;
      case "Facebook":
        return ProgrammingIcons.facebook_plain;
    }
    return null;
  }
}
