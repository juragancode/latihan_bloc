import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/pages/home.dart';
import 'package:latihan_bloc/pages/other.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Counter mycounter = Counter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: HomePage(),
      // ),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider.value(
              value: mycounter,
              child: HomePage(),
            ),
        "/other": (context) => BlocProvider.value(
              value: mycounter,
              child: OtherPage(),
            ),
      },
    );
  }
}
