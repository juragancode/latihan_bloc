import 'package:latihan_bloc/bloc/export.dart';

class RandomRepository {
  UserProvider userProvider = UserProvider();
  MasakanProvider masakanProvider = MasakanProvider();

  Future<Map<String, dynamic>> getRandomData() async {
    Map<String, dynamic> dataUser = await userProvider.getDataUser();
    Map<String, dynamic> dataMasakan = await masakanProvider.getDataMasakan();

    if (dataMasakan["error"] == true || dataUser["error"] == true) {
      return {
        "error": true,
        "message": "Terjadi error...",
      };
    }

    // GET RANDOM USER
    UserModel userModel = dataUser["data"] as UserModel;

    late DataUser dataRandomUser;

    if (userModel.data! != null) {
      dataRandomUser = userModel.data!.randomUser();
    } else {
      dataRandomUser = DataUser();
    }

    // GET RANDOM MASAKAN
    MasakanModel masakanModel = dataMasakan["data"] as MasakanModel;

    late Meals dataMeals;

    if (masakanModel.meals! != null) {
      dataMeals = masakanModel.meals!.getMeals();
    } else {
      dataMeals = Meals();
    }

    // Masukan Dalam 1 Kesatuan
    return {
      "error": false,
      "message": "Berhasil Get Data",
      "data": DataHomeModel(
        fullname: "${dataRandomUser.firstName} ${dataRandomUser.lastName}",
        email: "${dataRandomUser.email}",
        photoProfile: "${dataRandomUser.avatar}",
        masakan: "${dataMeals.strMeal}",
        gambarMasakan: "${dataMeals.strMealThumb}",
        category: "${dataMeals.strCategory}",
        masDaerah: "${dataMeals.strArea}",
        tag: "${dataMeals.strTags}",
        youtube: "${dataMeals.strYoutube}",
      ),
    };
  }
}

extension RandomUser on List<DataUser> {
  DataUser randomUser() {
    return elementAt(Random().nextInt(length - 1));
  }
}

extension GetMeals on List<Meals> {
  Meals getMeals() {
    return elementAt(0);
  }
}
