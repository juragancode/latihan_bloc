import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    Counter myCounter = context.read<Counter>();

    return Center(
      child: BlocBuilder(
        bloc: myCounter,
        builder: (context, state) {
          return Center(
            child: Text(
              "$state",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
