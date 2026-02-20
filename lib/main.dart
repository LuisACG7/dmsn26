import 'package:dmsn26/listeners/value_listener.dart';
import 'package:dmsn26/screens/dashboard_screen.dart';
import 'package:dmsn26/screens/login_screen.dart';
import 'package:dmsn26/utils/theme_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDarkMode,
      builder: (context, value, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          routes: {
            "/dash" : (context) => DashboardScreen() 
          },
          theme: value ? ThemeApp.WarmTheme() : ThemeData.light(),
        );
      }
    );
  }
}