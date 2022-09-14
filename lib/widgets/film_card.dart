import 'package:flutter/material.dart';
import 'package:moviez_app/widgets/rating.dart';

class FilmCard extends StatelessWidget {
  final int index, rating;
  final String title, category, imageUrl;

  const FilmCard(
      {this.index = 1,
      required this.title,
      required this.category,
      required this.imageUrl,
      required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 130,
      child: Row(
        children: [
          Image.asset(imageUrl),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Metropolis',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                category,
                style: TextStyle(fontFamily: 'TTNorm', fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Rating(rating)
            ],
          )
        ],
      ),
    );
  }
}
