import 'package:get/get.dart';
import 'package:teste_apod/app/core/repositories/apod_repository.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put(ApodLocalRepository());
    Get.put(ApodRepository(Get.find()));
    Get.put(HomeController(Get.find(), Get.find()));
  }
}
