import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/pages/data_widget.dart';
import 'package:latihan_bloc/pages/other.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    Counter myCounter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: myCounter,
                child: const OtherPage(),
              ),

              // builder: (context) => BlocProvider(
              //   create: (context) => myCounter,
              //   child: const OtherPage(),
              // ),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios),
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
