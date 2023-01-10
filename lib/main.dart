import 'package:latihan_bloc/bloc/export.dart';

void main() {
  Bloc.observer = myObserver();
  runApp(App());
}
