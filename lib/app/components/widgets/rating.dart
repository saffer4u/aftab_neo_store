import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double iconSize;
  final void Function(double)? onRatingUpdate;
  Rating({
    Key? key,
    this.onRatingUpdate,
    required this.iconSize,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        itemSize: iconSize,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 0.01),
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: onRatingUpdate == null
            ? (rating) {
                log(rating.toString());
              }
            : onRatingUpdate!);
  }
}
