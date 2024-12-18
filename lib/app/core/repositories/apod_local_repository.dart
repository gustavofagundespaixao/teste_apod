import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_global_variables.dart';

class ApodLocalRepository {
  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<List<ApodModel>> getAll() async {
    await init();

    final result = _sharedPreferences!
        .getStringList(AppGlobalVariables.keySharedPreferences);

    final list = result?.map(
          (e) {
            return ApodModel.fromJson(e);
          },
        ).toList() ??
        [];

    list.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    return list;
  }

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

    result.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    await _set(result);

    return result;
  }

  Future<List<ApodModel>> remove(ApodModel value) async {
    final result = await getAll();

    result.removeWhere(
      (element) {
        return element.date == value.date;
      },
    );

    result.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    await _set(result);

    return result;
  }

  Future<void> _set(List<ApodModel> value) async {
    await _sharedPreferences!.setStringList(
        AppGlobalVariables.keySharedPreferences,
        value.map(
          (e) {
            return e.toJson();
          },
        ).toList());
  }
}
