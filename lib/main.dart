import 'package:flutter/material.dart';
import 'package:intv_movie/core/router/app_router.dart';
import 'package:intv_movie/core/router/route_names.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  
  MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intv Movie',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: widget.appRouter.onGenerateRoute,
      initialRoute: mainPageRoute,
    );
  }
}
