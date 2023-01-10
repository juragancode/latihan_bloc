import 'package:latihan_bloc/bloc/export.dart';

class EditPage extends StatelessWidget {
  EditPage(this.user, {Key? key}) : super(key: key);
  final User user;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userB = context.read<UserBloc>();
    nameC.text = user.name;
    ageC.text = user.age.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: nameC,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: ageC,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                userB.add(
                  EditUserEvent(
                    User(
                      id: user.id,
                      name: nameC.text,
                      age: int.parse(ageC.text),
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: Text("Edit User"),
            ),
          ],
        ),
      ),
    );
  }
}
