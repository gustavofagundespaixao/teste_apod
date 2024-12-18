import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/widgets/apod_details/apod_widget_detail.dart';

class DetailPage extends GetView {
  static String routeName = '/details';

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: ApodWidgetDetail(value: Get.arguments, showDate: true),
    );
  }
}
