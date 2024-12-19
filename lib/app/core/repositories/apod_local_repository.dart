import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_global_variables.dart';

class ApodLocalRepository {
  SharedPreferences? _sharedPreferences;
  final List<ApodModel> items = [];

  Future<void> init() async {
    //Caso o SharedPreferences esteja nulo eu crio uma instancia dele
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<List<ApodModel>> getAll() async {
    await init();

    final List<String>? result = _sharedPreferences!
        .getStringList(AppGlobalVariables.keySharedPreferences);

    return _stringListToModelList(result);
  }

  //Verifico se existe o registro salvo na lista do SharedPreferences
  Future<bool> get(ApodModel value) async {
    final result = await getAll();

    return result.indexWhere(
          (element) {
            return element.title == value.title;
          },
        ) >=
        0;
  }

  Future<List<ApodModel>> add(ApodModel value) async {
    final result = await getAll();
    result.add(value);

    return await _saveAndSortList(result);
  }

  Future<List<ApodModel>> remove(ApodModel value) async {
    final result = await getAll();

    result.removeWhere(
      (element) {
        return element.date == value.date;
      },
    );

    return await _saveAndSortList(result);
  }

  //Converto a lista de strings para uma lista de ApodModel
  List<ApodModel> _stringListToModelList(List<String>? value) {
    final List<ApodModel> tempList =
        value?.map(ApodModel.fromJson).toList() ?? [];

    tempList.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    return tempList;
  }

  //Salvo a lista de modelos no SharedPreferences em forma de list da json
  Future<List<ApodModel>> _saveAndSortList(List<ApodModel> value) async {
    value.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    await _sharedPreferences!.setStringList(
        AppGlobalVariables.keySharedPreferences,
        value.map(
          (e) {
            return e.toJson();
          },
        ).toList());

    return value;
  }
}
