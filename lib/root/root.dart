import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_site/widgets/navbar/navbar.dart';
import 'package:personal_site/widgets/navbar/navigation_notification.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<NavigationNotification>(
        onNotification: (notification) {
          debugPrint(notification.route);
          return true;
        },
        child: Column(
          children: [
            const Navbar(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
