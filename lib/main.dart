import 'package:shopping_app/shopping_home_screen.dart';
import 'package:shopping_app/signin_page.dart';
import 'package:shopping_app/signup_page.dart';
import 'package:shopping_app/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      routes: {
        "/signup": (context) => const SignUpScreen(),
        "/signin": (context) => const SignInScreen(),
        "/homescreen": (context) => const ShoppingHomeScreen(),
      },
    );
  }
}



