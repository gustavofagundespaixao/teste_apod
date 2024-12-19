import 'package:get/get.dart';
import 'package:teste_apod/app/core/client/app_client.dart';
import 'package:teste_apod/app/core/repositories/apod_local_repository.dart';
import 'package:teste_apod/app/core/controllers/favorite_controller.dart';
import 'app_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AppClient());
    Get.put(AppController());

    //Aqui carrego os favoritos gravados localmente utilizando o shared_preferences e atribuo uma variável
    //observavel em FavoriteController para que todo meu aplicativo possa ouvir as alterações
    Get.put(ApodLocalRepository());
    Get.put(FavoriteController(Get.find()));
  }
}
