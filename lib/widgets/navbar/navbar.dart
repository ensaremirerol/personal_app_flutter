import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_site/widgets/navbar/navbar_item.dart';
import 'package:personal_site/widgets/navbar/navigation_notification.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key, this.initialRoute = "", required this.items})
      : super(key: key);
  final String initialRoute;
  final List<NavbarItemModel> items;
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _selectedRoute = "";

  @override
  void initState() {
    super.initState();
    _selectedRoute = widget.initialRoute;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<NavigationNotification>(
      onNotification: (NavigationNotification notification) {
        setState(() {
          _selectedRoute = notification.route;
        });
        return false;
      },
      child: Container(
        width: double.infinity,
        height: 80,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ensar Emir EROL",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                        )),
                const Expanded(
                  child: SizedBox(),
                ),
              ]..addAll(_buildNavbarItems)),
        ),
      ),
    );
  }

  List<Widget> get _buildNavbarItems => [
        for (final item in widget.items)
          NavbarItem(
            title: item.title,
            route: item.route,
            isSelected: item.route == _selectedRoute,
            key: Key(item.route + "navbar"),
          )
      ];
}

class NavbarItemModel {
  final String title;
  final String route;
  const NavbarItemModel({
    required this.title,
    required this.route,
  });
}

