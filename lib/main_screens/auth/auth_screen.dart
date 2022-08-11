import 'package:ecomflutter3users/consts/consts_shelf.dart';
import 'package:ecomflutter3users/main_screens/auth/components/login_page.dart';
import 'package:ecomflutter3users/main_screens/auth/components/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "/authscreen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AuthAppbar(),
        body: Container(
          decoration: container,
          child: TabBarView(
            children: [
              LoginPage(),
              SignUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthAppbar extends StatelessWidget implements PreferredSize {
  const AuthAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(decoration: container),
      title: const Text(
        "Ecom App",
        style: TextStyle(
          fontSize: 30,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: const TabBar(
        indicatorColor: Colors.orange,
        indicatorWeight: 5.0,
        tabs: [
          Tab(
            text: "Login",
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
          Tab(
            text: "Register",
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => Container();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 150);
}
