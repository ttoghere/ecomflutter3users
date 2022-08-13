import 'package:flutter/material.dart';


class AppBarWithCartBadge extends StatefulWidget with PreferredSizeWidget
{
  PreferredSizeWidget? preferredSizeWidget;
  String? sellerUID;

  AppBarWithCartBadge({this.preferredSizeWidget, this.sellerUID,});

  @override
  State<AppBarWithCartBadge> createState() => _AppBarWithCartBadgeState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => preferredSizeWidget == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}



class _AppBarWithCartBadgeState extends State<AppBarWithCartBadge>
{
  @override
  Widget build(BuildContext context)
  {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                Colors.pinkAccent,
                Colors.purpleAccent,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )
        ),
      ),
      automaticallyImplyLeading: true,
      title: const Text(
        "iShop",
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 3,
        ),
      ),
      centerTitle: true,
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: ()
                {

                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
            ),
            Positioned(
              child: Stack(
                children: [

                  const Icon(
                    Icons.brightness_1,
                    size: 20,
                    color: Colors.deepPurpleAccent,
                  ),

                  Positioned(
                    top: 2,
                    right: 6,
                    child: Center(
                      child: Text(
                        "0",
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
