import 'package:flutter/material.dart';
import 'package:intv_movie/core/router/route_names.dart';
import 'package:intv_movie/core/shared-page/detail_page.dart';
import 'package:intv_movie/core/shared-page/main_page.dart';
import 'package:intv_movie/core/utils/widget_constants.dart';
import 'package:intv_movie/feature/movie/persentation/page/movie_page.dart';
import 'package:intv_movie/feature/tv/persentation/page/tv_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case mainPageRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      case moviePageRoute:
        return MaterialPageRoute(builder: (_) => MoviePage());
      case tvPageRoute:
        return MaterialPageRoute(builder: (_) => TvPage());
      case detailPageRoute:
        return MaterialPageRoute(builder: (_) => DetailPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(
                'Halaman ${settings.name} tidak ditemukan!',
                style: TextStyle(color: mainColor),
              ),
            ),
          ),
        );
    }
  }
}