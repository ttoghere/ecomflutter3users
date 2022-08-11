import 'package:ecomflutter3users/main_screens/auth/auth_screen.dart';
import 'package:ecomflutter3users/main_screens/ms_shelf.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecom - Users',
     initialRoute: AuthScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
      },
    );
  }
}
