import 'package:cart_stepper/cart_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomflutter3users/main_screens/components/appbar_cart_badge.dart';
import 'package:ecomflutter3users/models/items.dart';
import 'package:flutter/material.dart';

class ItemsDetailsScreen extends StatefulWidget {
  Items? model;

  ItemsDetailsScreen({
    this.model,
  });

  @override
  State<ItemsDetailsScreen> createState() => _ItemsDetailsScreenState();
}

class _ItemsDetailsScreenState extends State<ItemsDetailsScreen> {
  int counterLimit = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithCartBadge(
        sellerUID: widget.model!.sellerUID.toString(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add to Cart"),
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.model!.thumbnailUrl.toString(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CartStepperInt(
                  count: counterLimit,
                  size: 50,
                  deActiveBackgroundColor: Colors.red[900],
                  activeForegroundColor: Colors.white,
                  activeBackgroundColor: Colors.orange,
                  didChangeCount: (value) {
                    if (value < 1) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("The quantity cannot be less than 1")));

                      return;
                    }

                    setState(() {
                      counterLimit = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "${widget.model!.itemTitle}:",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6.0),
              child: Text(
                widget.model!.longDescription.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.orange[900]!,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${widget.model!.price} €",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 320.0),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.model!.itemInfo.toString(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.orange[900]!,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
