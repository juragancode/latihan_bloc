import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Counter myCounter = context.read<Counter>(); // hanya dibaca 1X
    // Counter myCounter = context.watch<
    //     Counter>(); // mengalami perubahan saat state juga berubah, kekurangannya merebuild semua Scaffold

    return Scaffold(
      appBar: AppBar(
        title: Text("Extension Method"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              Counter myCounter = context.watch<Counter>();
              return Text(
                "${myCounter.state}",
                style: TextStyle(
                  fontSize: 100,
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => context.read<Counter>().kurangData(),
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => context.read<Counter>().tambahData(),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
