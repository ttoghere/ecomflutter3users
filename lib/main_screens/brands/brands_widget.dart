import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomflutter3users/main_screens/items/items_screen.dart';
import 'package:ecomflutter3users/models/brands.dart';
import 'package:flutter/material.dart';

class BrandsWidget extends StatefulWidget {
  Brands? model;

  BrandsWidget({
    this.model,
  });

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(
          model: widget.model,
        )));
      },
      child: Card(
        color: Colors.white60,
        elevation: 10,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    widget.model!.thumbnailUrl.toString(),
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  widget.model!.brandTitle.toString(),
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
