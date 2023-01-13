import 'package:latihan_bloc/bloc/export.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RandomBloc randomB = context.read<RandomBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Random App"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<RandomBloc, RandomState>(
          bloc: randomB,
          builder: (context, state) {
            if (state is RandomLoading) {
              return SizedBox(
                height: 150,
                width: 150,
                child: LiquidCircularProgressIndicator(
                  value: 0.6,
                  valueColor: AlwaysStoppedAnimation(Colors.teal),
                  backgroundColor: Colors.white,
                  borderColor: Colors.teal,
                  borderWidth: 5.0,
                  center: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            }
            if (state is RandomError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Terjadi Kesalahan"),
                  Text("Status Code: ${state.error}"),
                ],
              );
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
                Text(
                  "${dataHome.masakan}",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text("${dataHome.category}"),
                SizedBox(height: 15),
                Text("${dataHome.masDaerah}"),
                SizedBox(height: 15),
                Text((dataHome.tag != "null") == true
                    ? "#${dataHome.tag}"
                    : "#"),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: Image.network("${dataHome.gambarMasakan}"),
                    ),
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
        backgroundColor: Colors.teal,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
