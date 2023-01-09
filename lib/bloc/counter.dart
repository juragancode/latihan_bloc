import 'package:bloc/bloc.dart';
import 'package:latihan_bloc/bloc/counter_event.dart';

class Counter extends Bloc<CounterEvent, int> {
  Counter(int initial) : super(initial) {
    on<DecrementCounter>((event, emit) {
      // Ini proses untuk event decrement
      emit((state - 1) % event.value);
    });
    on<IncrementCounter>((event, emit) {
      // Ini proses untuk evente ...
      emit((state + 1) * event.value);
    });
  }

  // @override
  // void onChange(change) {
  //   print(change);
  // }

  // @override
  // void onError(error, trace) {
  //   print(error);
  // }

  // @override
  // void onTransition(transition) {
  //   print(transition);
  // }
}
