import 'package:ecomflutter3users/consts/consts_shelf.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget implements PreferredSize {
  const MainAppbar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return AppBar(
      title: Text(
        "Hello World",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
      flexibleSpace: Container(decoration: container),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size(400, 50);
}
