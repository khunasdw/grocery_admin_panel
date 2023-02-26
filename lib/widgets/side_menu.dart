import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_admin_panel/provider/dark_theme_provider.dart';
import 'package:grocery_admin_panel/inner_screens/all_orders_screen.dart';
import 'package:grocery_admin_panel/screens/main_screen.dart';
import 'package:grocery_admin_panel/inner_screens/view_all_product_screen.dart';
import 'package:grocery_admin_panel/services/utils.dart';
import 'package:provider/provider.dart';

import 'text_widget.dart';

class SideMenuState extends StatefulWidget {
  const SideMenuState({Key? key}) : super(key: key);

  @override
  State<SideMenuState> createState() => _SideMenuStateState();
}

class _SideMenuStateState extends State<SideMenuState> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/grocery_icon.png'),
          ),
          DrawerListTile(
            title: 'Main',
            press: () {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
            icon: IconlyBold.home,
          ),
          DrawerListTile(
            title: 'View all product',
            press: () {
              Navigator.pushReplacementNamed(
                  context, ViewAllProductScreen.routeName);
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: 'View all order',
            press: () {
              Navigator.pushReplacementNamed(context, AllOrdersScreen.routeName);
            },
            icon: IconlyBold.bag2,
          ),
          SwitchListTile(
            title: const Text('Theme'),
            secondary: Icon(themeState.getDarkTheme
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            value: theme,
            onChanged: (value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: 18,
      ),
      title: TextWidget(
        text: title,
        color: color,
      ),
    );
  }
}
