import 'package:bloc/bloc.dart';
import 'package:latihan_bloc/bloc/counter_event.dart';

class Counter extends Bloc<CounterEvent, int> {
  Counter(int initial) : super(initial) {
    on((event, emit) {
      if (event == CounterEvent.decrement) {
        emit(state - 1);
      }
      if (event == CounterEvent.increment) {
        emit(state + 1);
      }
    });
  }
}
