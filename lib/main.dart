import 'package:ecomflutter3users/consts/variables.dart';
import 'package:ecomflutter3users/firebase_options.dart';
import 'package:ecomflutter3users/main_screens/auth/auth_screen.dart';
import 'package:ecomflutter3users/main_screens/ms_shelf.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecom - Users',
      // home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}
