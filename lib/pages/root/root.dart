import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_site/pages/home/home_page.dart';
import 'package:personal_site/pages/projects/projects_page.dart';
import 'package:personal_site/widgets/navbar/navbar.dart';
import 'package:personal_site/widgets/navbar/navigation_notification.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String currentRoute = HomePage.routeName;
    return Scaffold(
      body: NotificationListener<NavigationNotification>(
        onNotification: (notification) {
          if (currentRoute != notification.route) {
            _navigatorKey.currentState!.pushNamed(notification.route);
            currentRoute = notification.route;
          }
          return true;
        },
        child: Column(
          children: [
            const Navbar(
              initialRoute: HomePage.routeName,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Navigator(
                key: _navigatorKey,
                initialRoute: HomePage.routeName,
                onGenerateRoute: (settings) {
                  late Widget page;
                  switch (settings.name) {
                    case HomePage.routeName:
                      page = const HomePage();
                      break;
                    case ProjectsPage.routeName:
                      page = const ProjectsPage();
                      break;
                    default:
                      page = const HomePage();
                      break;
                  }
                  return PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          page,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final offsetTween = Tween(begin: begin, end: end);
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        );
                        return FadeTransition(
                          opacity: curvedAnimation,
                          child: SlideTransition(
                            position: offsetTween.animate(curvedAnimation),
                            child: Container(
                                color: Theme.of(context).canvasColor,
                                child: child),
                          ),
                        );
                      });
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
