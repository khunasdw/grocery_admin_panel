import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/consts/theme_data.dart';
import 'package:grocery_admin_panel/provider/dark_theme_provider.dart';
import 'package:grocery_admin_panel/inner_screens/all_orders_screen.dart';
import 'package:provider/provider.dart';
import 'package:grocery_admin_panel/screens/main_screen.dart';
import 'controllers/MenuController.dart';
import 'inner_screens/add_product.dart';
import 'inner_screens/view_all_product_screen.dart';
// import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MyMenuController(),
            ),
            ChangeNotifierProvider(create: (context) => themeChangeProvider)
          ],
          child: Consumer<DarkThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Grocery',
                theme: Styles.themeData(themeProvider.getDarkTheme, context),
                home: const MainScreen(),
                routes: {
                  ViewAllProductScreen.routeName: (context) =>
                  const ViewAllProductScreen(),
                  MainScreen.routeName: (context) => const MainScreen(),
                  AllOrdersScreen.routeName: (context) => const AllOrdersScreen(),
                  UploadProductForm.routeName: (context) =>
                  const UploadProductForm(),
                },
              );
            },
          ),
        );
      },
    );
  }
}
