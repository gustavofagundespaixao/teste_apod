import 'package:get/get.dart';
import 'package:teste_apod/app/modules/detail/detail_page.dart';
import 'package:teste_apod/app/modules/favorite/favorite_page.dart';
import 'package:teste_apod/app/modules/home/home_bindings.dart';
import 'package:teste_apod/app/modules/home/home_page.dart';
import 'package:teste_apod/app/modules/image/image_page.dart';

class AppPages {
  static List<GetPage> get pages {
    return [
      GetPage(
        binding: HomeBindings(),
        name: HomePage.routeName,
        page: () => const HomePage(),
      ),
      GetPage(
        name: FavoritePage.routeName,
        page: () => const FavoritePage(),
      ),
      GetPage(
        name: DetailPage.routeName,
        page: () => const DetailPage(),
        fullscreenDialog: true,
      ),
      GetPage(
        name: ImagePage.routeName,
        page: () => const ImagePage(),
        fullscreenDialog: true,
      ),
    ];
  }
}
