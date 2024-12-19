import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/widgets/apod_details/apod_detail_widget.dart';
import 'package:teste_apod/app/core/widgets/app_empty_widget.dart';
import 'package:teste_apod/app/core/widgets/app_error_widget.dart';
import 'package:teste_apod/app/core/widgets/app_loading_widget.dart';
import 'package:teste_apod/app/modules/favorite/favorite_page.dart';
import 'package:teste_apod/app/modules/home/widgets/home_date_widget.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  static String routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto APOD'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: HomeDateWidget(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(FavoritePage.routeName);
            },
            child: const Text('Favoritos'),
          ),
        ],
      ),
      body: Obx(() {
        return FutureBuilder<ApodModel>(
          future: controller.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AppLoadingWidget();
            } else if (snapshot.hasError) {
              return AppErrorWidget();
            } else if (snapshot.data == null) {
              return AppEmptyWidget();
            } else {
              return ApodDetailWidget(value: snapshot.data!);
            }
          },
        );
      }),
    );
  }
}
