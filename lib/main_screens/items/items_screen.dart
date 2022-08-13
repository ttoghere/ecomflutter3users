import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomflutter3users/consts/consts_shelf.dart';
import 'package:ecomflutter3users/main_screens/items/item_widget.dart';
import 'package:ecomflutter3users/models/brands.dart';
import 'package:ecomflutter3users/models/items.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  Brands? model;

  ItemsScreen({
    this.model,
  });

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        flexibleSpace: Container(decoration: container),
        title: const Text(
          "iShop",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 100,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("sellers")
              .doc(widget.model!.sellerUID.toString())
              .collection("brands")
              .doc(widget.model!.brandID)
              .collection("items")
              .orderBy("publishedDate", descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot dataSnapshot) {
            if (dataSnapshot.hasData) //if brands exists
            {
              //display brands
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  Items itemsModel = Items.fromJson(
                    dataSnapshot.data.docs[index].data()
                        as Map<String, dynamic>,
                  );

                  return ItemWidget(
                    model: itemsModel,
                  );
                },
                itemCount: dataSnapshot.data.docs.length,
              );
            } else //if brands NOT exists
            {
              return Center(
                child: Text(
                  "No items exists",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
