import 'package:latihan_bloc/bloc/export.dart';

class App extends StatelessWidget {
  final RandomRepository randomRepository = RandomRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // -------------- Multi Bloc Provider --------------

        BlocProvider(create: (context) => RandomBloc(randomRepository)),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
