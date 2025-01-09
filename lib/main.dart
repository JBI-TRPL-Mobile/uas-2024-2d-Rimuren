import 'package:flutter/material.dart';
import 'package:template_project/screens/welcome.dart';
import 'package:template_project/screens/login_screen.dart';
import 'package:template_project/screens/signup_screen.dart';
import 'package:template_project/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Register Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
