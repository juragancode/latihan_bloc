import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/pages/data_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    Counter myCounter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    myCounter.kurangData();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                ),
              ),
              DataWidget(),
              Material(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    myCounter.tambahData();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
