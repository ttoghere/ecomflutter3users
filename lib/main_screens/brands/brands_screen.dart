import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomflutter3users/consts/consts_shelf.dart';
import 'package:ecomflutter3users/main_screens/brands/brands_widget.dart';
import 'package:ecomflutter3users/main_screens/components/text_delegate_widget.dart';
import 'package:ecomflutter3users/main_screens/msw_shelf.dart';
import 'package:ecomflutter3users/models/brands.dart';
import 'package:ecomflutter3users/models/sellers.dart';
import 'package:flutter/material.dart';

class BrandsScreen extends StatefulWidget {
  Sellers? model;

  BrandsScreen({
    this.model,
  });

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: MainDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: container,
        ),
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("sellers")
              .doc(widget.model!.uid.toString())
              .collection("brands")
              .orderBy("publishedDate", descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot dataSnapshot) {
            if (dataSnapshot.hasData) //if brands exists
            {
              //display brands
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  Brands brandsModel = Brands.fromJson(
                    dataSnapshot.data.docs[index].data()
                        as Map<String, dynamic>,
                  );

                  return BrandsWidget(
                    model: brandsModel,
                  );
                },
                itemCount: dataSnapshot.data.docs.length,
              );
            } else //if brands NOT exists
            {
              return const Center(
                child: Text(
                  "No brands exists",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
