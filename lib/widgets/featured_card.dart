import 'package:flutter/material.dart';
import 'package:moviez_app/theme.dart';
import 'package:moviez_app/widgets/rating.dart';

class FeaturedCard extends StatelessWidget {
  final int index, rating;
  final String title, category, imageUrl;

  const FeaturedCard(
      {this.index = 1,
      required this.title,
      required this.category,
      required this.imageUrl,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, left: index == 0 ? 24 : 0),
      width: 300,
      child: Column(
        children: [
          Container(
            width: 300,
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: semiBoldTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    category,
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              Rating(rating)
            ],
          )
        ],
      ),
    );
  }
}
