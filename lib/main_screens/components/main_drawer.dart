// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomflutter3users/main_screens/auth/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter3users/consts/variables.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.red[600],
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(demoLogo),
                  radius: 70,
                ),
                const SizedBox(
                  height: 12,
                ),
                //Username
                Text(
                  "User Name",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 25, color: Colors.white),
                ),
                const Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 3,
                ),
                /**Header**/
                DrawerItem(
                  label: "Home",
                  iconData: Icons.home,
                  onTap: () {},
                ),
                DrawerItem(
                  label: "Orders",
                  iconData: Icons.list,
                  onTap: () {},
                ),
                DrawerItem(
                  label: "History",
                  iconData: Icons.timelapse,
                  onTap: () {},
                ),
                DrawerItem(
                  label: "Wishlist",
                  iconData: Icons.mark_as_unread,
                  onTap: () {},
                ),
                DrawerItem(
                  label: "Search",
                  iconData: Icons.search,
                  onTap: () {},
                ),
                DrawerItem(
                  label: "Sign Out",
                  iconData: Icons.logout,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamed(AuthScreen.routeName);
                  },
                ),

                /**Body**/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData iconData;
  const DrawerItem({
    Key? key,
    required this.label,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconData,
            color: Colors.white,
          ),
          title: Text(
            label,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          onTap: onTap,
          trailing: Opacity(
            opacity: 0.6,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
        const Divider(
          height: 5,
          color: Colors.white,
          thickness: 3,
        ),
      ],
    );
  }
}
