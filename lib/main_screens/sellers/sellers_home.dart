import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomflutter3users/consts/consts_shelf.dart';
import 'package:ecomflutter3users/consts/variables.dart';
import 'package:ecomflutter3users/main_screens/msw_shelf.dart';
import 'package:ecomflutter3users/main_screens/sellers/sellers_widget.dart';
import 'package:ecomflutter3users/models/sellers.dart';
import 'package:flutter/material.dart';

class SellersHome extends StatefulWidget {
  static const routeName = "/sellerhome";
  @override
  State<SellersHome> createState() => _SellersHomeState();
}

class _SellersHomeState extends State<SellersHome> {
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
          "Ecom",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //image slider
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .9,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: itemsImageList.map((index) {
                  return Builder(builder: (BuildContext c) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          index,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .snapshots(),
              builder: (context, AsyncSnapshot dataSnapshot) {
                if (dataSnapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      Sellers model = Sellers.fromJson(
                          dataSnapshot.data.docs[index].data()
                              as Map<String, dynamic>);

                      return SellersWidget(
                        model: model,
                      );
                    },
                    itemCount: dataSnapshot.data.docs.length,
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Sellers Data exists.",
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
