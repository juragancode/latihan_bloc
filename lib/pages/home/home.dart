import 'package:latihan_bloc/bloc/export.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomBloc randomB = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Random App"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<RandomBloc, RandomState>(
          bloc: randomB,
          builder: (context, state) {
            if (state is RandomLoading) {
              return CircularProgressIndicator();
            }
            if (state is RandomError) {
              return Text("Terjadi Kesalahan");
            }
            if (state is RandomInitial) {
              return Text("No data available");
            }

            DataHomeModel dataHome = state.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(
                    child: Image.network("${dataHome.photoProfile}"),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "${dataHome.fullname}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text("${dataHome.email}"),
                SizedBox(height: 15),
                Text("🍹🍭🍧🎂🍰🌮🌭🍟🍡🧃🍷🧁🍫🍬🍇🍓🍉🥗🍵🍕"),
                SizedBox(height: 15),
                Text("${dataHome.masakan}"),
                SizedBox(height: 5),
                Text("${dataHome.category}"),
                SizedBox(height: 5),
                Text("${dataHome.masDaerah}"),
                SizedBox(height: 5),
                Text("${dataHome.tag}"),
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Container(
                    child: Image.network("${dataHome.gambarMasakan}"),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${dataHome.youtube}",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          randomB.add(GetRandomEvent());
          randomB.state.data.toJson();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
