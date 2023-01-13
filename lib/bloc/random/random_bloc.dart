import 'package:latihan_bloc/bloc/export.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomRepository randomRepository;

  RandomBloc(this.randomRepository) : super(RandomInitial(DataHomeModel())) {
    on<GetRandomEvent>((event, emit) async {
      try {
        emit(RandomLoading(state.data));

        Map<String, dynamic> dataRandom =
            await randomRepository.getRandomData();

        if (dataRandom["error"] == true) {
          String pesanError = dataRandom["message"];
          emit(RandomError(state.data, pesanError));
        } else {
          DataHomeModel dataHome = dataRandom["data"];
          emit(RandomCompleted(dataHome));
        }
      } catch (e) {
        emit(RandomError(state.data, e.toString()));
      }
    });
  }
}
