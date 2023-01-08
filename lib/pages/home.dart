import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Selector"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("Nama : ${state['name']}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("Umur : ${state['age']} Tahun");
          //   },
          // ),
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              return Text("Nama : $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              return Text("Umur : $state");
            },
          ),
          SizedBox(height: 20),
          TextField(
            onChanged: (value) => userBloc.changeName(value),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] - 1);
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] + 1);
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
