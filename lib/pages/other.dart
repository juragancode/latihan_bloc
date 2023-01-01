import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: myCounter,
          builder: (context, state) {
            return Center(
              child: Text(
                "$state",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
