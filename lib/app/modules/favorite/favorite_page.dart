import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_date_format.dart';
import 'package:teste_apod/app/core/widgets/app_empty_widget.dart';
import 'package:teste_apod/app/modules/detail/detail_page.dart';
import '../../core/controllers/favorite_controller.dart';

class FavoritePage extends GetView<FavoriteController> {
  static String routeName = '/favorite';

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return AppEmptyWidget();
        } else {
          return ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final ApodModel value = controller.items[index];

              return Card(
                child: ListTile(
                  onTap: () {
                    Get.toNamed(DetailPage.routeName, arguments: value);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    value.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    AppDateFormat.dateToStringFormat(value: value.date),
                  ),
                ),
              );
            },
          );
        }
      }),
      // body: FutureBuilder<List<ApodModel>>(
      //   future: controller.getAll(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return AppLoadingWidget();
      //     } else if (snapshot.data == null) {
      //       return AppEmptyWidget();
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           final ApodModel value = snapshot.data![index];

      //           return Card(
      //             child: ListTile(
      //               onTap: () {},
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               title: Text(
      //                 value.title,
      //                 maxLines: 1,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //               subtitle: Text(
      //                 AppDateFormat.dateToStringFormat(value: value.date),
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
