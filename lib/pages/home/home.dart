import 'package:latihan_bloc/bloc/export.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userB,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return Center(
              child: Text("No Data Available"),
            );
          }
          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(user.name),
                subtitle: Text("${user.age}"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
