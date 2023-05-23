import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search/views/search.dart';
import 'controllers/bloc.dart';

Future<void> main() async {
  final bLoC = BLoC();
  runApp(MyApp(bLoC: bLoC));
}

class MyApp extends StatefulWidget {
  final BLoC bLoC;
  const MyApp({Key? key, required this.bLoC}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: GoogleFonts.tajawalTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SearchScreen(bLoC: widget.bLoC,),
    );
  }
}
