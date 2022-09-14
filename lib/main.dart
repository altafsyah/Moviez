import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MoviezApp());
}

class MoviezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
