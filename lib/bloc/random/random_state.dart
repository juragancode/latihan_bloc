part of 'random_bloc.dart';

abstract class RandomState extends Equatable {
  RandomState(this.data);

  DataHomeModel data;

  @override
  List<Object> get props => [data];
}

class RandomInitial extends RandomState {
  RandomInitial(DataHomeModel data) : super(data);
}

class RandomLoading extends RandomState {
  RandomLoading(DataHomeModel data) : super(data);
}

class RandomError extends RandomState {
  RandomError(DataHomeModel data) : super(data);
}

class RandomCompleted extends RandomState {
  RandomCompleted(DataHomeModel data) : super(data);
}
