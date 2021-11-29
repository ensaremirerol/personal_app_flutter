import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_site/pages/root/root.dart';
import 'package:personal_site/service/portfolio_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: Colors.black,
              displayColor: Colors.black),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: PortfolioService(
          child: Builder(
            builder: (context) => FutureBuilder(
              future: PortfolioService.of(context).init(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const RootPage();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
