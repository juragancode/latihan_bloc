import 'package:latihan_bloc/bloc/export.dart';

class myObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print("$bloc => $change");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print("$bloc => $error");
    print("$bloc => $stackTrace");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("$bloc => $transition");
  }

  //  @override
  // void onChange(change) {
  //   print(change);
  // }

  // @override
  // void onError(error, trace) {
  //   print(error);
  //   print(trace);
  // }

  // @override
  // void onTransition(transition) {
  //   print(transition);
  // }
}
