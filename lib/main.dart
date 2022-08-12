import 'package:ecomflutter3users/firebase_options.dart';
import 'package:ecomflutter3users/main_screens/auth/auth_screen.dart';
import 'package:ecomflutter3users/main_screens/ms_shelf.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: AuthScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
      },
    );
  }
}
