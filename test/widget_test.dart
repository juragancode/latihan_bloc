import 'package:latihan_bloc/bloc/export.dart';

void main() async {
  RandomRepository randomRepository = RandomRepository();

  Map<String, dynamic> dataRandom = await randomRepository.getRandomData();
  DataHomeModel data = dataRandom["data"];
  print(dataRandom);
  print(data.toJson());
}
