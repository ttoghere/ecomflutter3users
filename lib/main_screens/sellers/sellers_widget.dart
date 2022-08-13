import 'package:ecomflutter3users/main_screens/brands/brands_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../models/sellers.dart';

class SellersWidget extends StatefulWidget {
  Sellers? model;

  SellersWidget({
    this.model,
  });

  @override
  State<SellersWidget> createState() => _SellersWidgetState();
}

class _SellersWidgetState extends State<SellersWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BrandsScreen(
                  model: widget.model,
                )));
      },
      child: Card(
        color: Colors.black54,
        elevation: 20,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    widget.model!.photoUrl.toString(),
                    height: 220,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  widget.model!.name.toString(),
                  style: const TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SmoothStarRating(
                  rating: widget.model!.ratings == null
                      ? 0.0
                      : double.parse(widget.model!.ratings.toString()),
                  starCount: 5,
                  color: Colors.orange,
                  borderColor: Colors.orange,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
