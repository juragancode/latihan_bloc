import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/counter_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter myCounter = Counter(0);
    int value = 10;

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc - General Observer"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            BlocBuilder<Counter, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text("$state", style: TextStyle(fontSize: 99));
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => myCounter.add(DecrementCounter(value)),
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => myCounter.add(IncrementCounter(value)),
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
