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

  //Carrega todos os favoritos local e atribuo a uma variavel observavel
  Future<void> getLocalAll() async {
    items.value = await _localRepository.getAll();
  }

  //Verifica se o modelo está favoritado
  Future<bool> isFavorite(ApodModel value) async {
    return await _localRepository.get(value);
  }

  //Adiciona modelo aos favoritos
  Future<void> addToFavorite(ApodModel value) async {
    final list = await _localRepository.add(value);

    items.value = list;
  }

  //Remove modelo aos favoritos
  Future<void> removeToFavorite(ApodModel value) async {
    final list = await _localRepository.remove(value);

    items.value = list;
  }
}
