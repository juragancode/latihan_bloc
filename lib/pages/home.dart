import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/counter_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter myCounter = Counter(); // hanya dibaca 1X

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc - Enum Class"),
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
                  onPressed: () => myCounter.add(CounterEvent.decrement),
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => myCounter.add(CounterEvent.increment),
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
