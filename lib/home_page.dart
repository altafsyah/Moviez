import 'package:flutter/material.dart';
import 'package:moviez_app/search_page.dart';
import 'package:moviez_app/theme.dart';

import 'data.dart';
import 'widgets/featured_card.dart';
import 'widgets/film_card.dart';

class HomePage extends StatelessWidget {
  var featured = data_featured;
  var film = data_film;

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, right: 12, top: 30, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moviez',
                  style: boldTextStyle.copyWith(fontSize: 28),
                ),
                Text(
                  'Watch much easier',
                  style: greyTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: darkColor,
                ))
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              _appBar(),
              Container(
                width: double.infinity,
                height: 280,
                child: ListView.builder(
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      return FeaturedCard(
                        index: index,
                        title: featured[index]['title'] as String,
                        category: featured[index]['category'] as String,
                        imageUrl: featured[index]['imageUrl'] as String,
                        rating: featured[index]['rating'] as int,
                      );
                    },
                    scrollDirection: Axis.horizontal),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From Disney',
                      style: boldTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: film
                          .map((data) => FilmCard(
                              title: data['title'] as String,
                              category: data['category'] as String,
                              imageUrl: data['imageUrl'] as String,
                              rating: data['rating'] as int))
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
