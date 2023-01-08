import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // EXTENTION METHOD
    // 1. context.read()
    // 2. context.watch()
    // 1. context.select()

    UserBloc myCounter = context.read<UserBloc>(); // hanya dibaca 1X
    // Counter myCounter = context.watch<
    //     Counter>(); // mengalami perubahan saat state juga berubah, kekurangannya merebuild semua Scaffold karena berada di bawah context yang memayungi/menaungi Scaffold

    // String nameUser =
    //     context.select<UserBloc, String>((value) => value.state["name"]);
    // int ageUser = context.select<UserBloc, int>((value) => value.state["age"]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Extension Method"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Builder(builder: (context) {
            String nameUser = context
                .select<UserBloc, String>((value) => value.state["name"]);
            return Text("Nama : $nameUser", style: TextStyle(fontSize: 24));
          }),
          SizedBox(height: 5),
          Builder(builder: (context) {
            int ageUser =
                context.select<UserBloc, int>((value) => value.state["age"]);
            return Text("Umur : $ageUser", style: TextStyle(fontSize: 24));
          }),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) => myCounter.changeName(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Builder(builder: (context) {
          //   Counter myCounter = context.watch<Counter>();
          //   return Text(
          //     "${myCounter.state}",
          //     style: TextStyle(
          //       fontSize: 100,
          //     ),
          //   );
          // }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () =>
                    myCounter.changeAge(myCounter.state["age"] - 1),
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () =>
                    myCounter.changeAge(myCounter.state["age"] + 1),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
