import 'package:flutter/material.dart';
import 'package:personal_site/models/basics_model.dart';
import 'package:personal_site/pages/home/programming_languages.dart';
import 'package:personal_site/pages/home/social_links.dart';
import 'package:personal_site/service/portfolio_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    BasicsModel basics = PortfolioService.of(context).portfolio.basics;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  basics.image ?? "",
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                basics.name ?? "",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            basics.summary ?? "",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const ProgrammingLanguagesWidget(),
          const SocialLinks()
        ],
      ),
    );
  }
}
