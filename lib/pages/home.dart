import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  Counter mycounter = Counter(inisialData: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            buildWhen: (previous, current) {
              if (current % 5 == 0) {
                return true;
              } else {
                return false;
              }
            },
            bloc: mycounter,
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
          // StreamBuilder(
          //   initialData: mycounter.inisialData,
          //   stream: mycounter.stream,
          //   builder: (context, snapshot) {
          //     return Center(
          //       child: Text(
          //         "${snapshot.data}",
          //         style: TextStyle(
          //           fontSize: 50,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  mycounter.kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  mycounter.tambahData();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
