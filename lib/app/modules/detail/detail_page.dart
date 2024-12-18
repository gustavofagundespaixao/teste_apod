import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/widgets/apod_details/apod_detail_widget.dart';

class DetailPage extends GetView {
  static String routeName = '/details';

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: ApodDetailWidget(value: Get.arguments, showDate: true),
    );
  }
}
