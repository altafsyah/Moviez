import 'package:flutter/material.dart';
import 'package:moviez_app/theme.dart';
import 'package:moviez_app/widgets/film_card.dart';

import 'data.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var search = data_search;

  @override
  Widget build(BuildContext context) {
    Widget searchField() {
      return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(
          top: 35,
        ),
        child: Row(
          children: [
            Container(
              width: 280,
              child: TextField(
                style: mediumTextStyle.copyWith(fontSize: 16),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xff0D0846),
                  ),
                  border: InputBorder.none,
                  fillColor: darkColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffFBFBFD), Color(0xffF0F1F6)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchField(),
                  Expanded(
                      child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '(3)',
                                style: TextStyle(fontWeight: FontWeight.w400))
                          ],
                          text: 'Search Result ',
                          style: boldTextStyle.copyWith(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: search.map((data) {
                          return FilmCard(
                              title: data['title'] as String,
                              category: data['category'] as String,
                              imageUrl: data['imageUrl'] as String,
                              rating: data['rating'] as int);
                        }).toList(),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 55, vertical: 14),
          decoration: BoxDecoration(
              color: Color(0xFF0D0846),
              borderRadius: BorderRadius.circular(37)),
          child: Text(
            "Suggest Movie",
            style: mediumTextStyle.copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
