import 'package:get/get.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/repositories/apod_local_repository.dart';

class FavoriteController extends GetxController {
  final ApodLocalRepository _localRepository;

  final RxList<ApodModel> items = RxList<ApodModel>([]);

  FavoriteController(this._localRepository);

  @override
  void onInit() {
    super.onInit();
    getLocalAll();
  }

  Future<void> getLocalAll() async {
    items.value = await _localRepository.getAll();
  }

  Future<bool> isFavorite(ApodModel value) async {
    return await _localRepository.get(value);
  }

  Future<void> addToFavorite(ApodModel value) async {
    final list = await _localRepository.add(value);

    items.value = list;
  }

  Future<void> removeToFavorite(ApodModel value) async {
    final list = await _localRepository.remove(value);

    items.value = list;
  }
}
