import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';
import 'utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LogInPage(),
        MyRoutes.profileRoute: (context) => const ProfilePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.signupRoute: (context) => const SignUpPage(), 
      },
    );
  }
}
