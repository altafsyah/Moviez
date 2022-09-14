import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;

  const Rating(this.rating);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 1; i <= 5; i++) ...[
            if (i <= rating) ...[
              Image.asset(
                'assets/images/star_filled.png',
                width: 18,
              ),
            ] else
              Image.asset(
                'assets/images/star_empty.png',
                width: 18,
              )
          ]
        ],
      ),
    );
  }
}
