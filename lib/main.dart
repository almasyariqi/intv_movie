import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/feature/movie/persentation/page/movie_page.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intv Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MoviePage(),
    );
  }
}
