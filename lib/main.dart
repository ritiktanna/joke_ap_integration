import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke_app/common_file/injector.dart';
import 'package:joke_app/homepage/presentation/home_page.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => child ?? const Offstage(),
      child: MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        )),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
