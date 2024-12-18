import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_apod/app/core/client/app_client.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/repositories/apod_repository.dart';

class HomeController extends GetxController {
  final AppClient appClient;
  final ApodRepository repository;

  HomeController(this.appClient, this.repository);

  final Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());

  void selectDateToday() {
    currentDate.value = DateTime.now();
  }

  Future<void> selectDate() async {
    final DateTime? result = await showDatePicker(
      context: Get.context!,
      currentDate: currentDate.value,
      firstDate: currentDate.value.add(const Duration(days: -365)),
      lastDate: DateTime.now(),
    );

    if (result != null) {
      currentDate.value = result;
    }
  }

  void nextDate() {
    currentDate.value = currentDate.value.add(const Duration(days: 1));
  }

  void previousDate() {
    currentDate.value = currentDate.value.add(const Duration(days: -1));
  }

  Future<ApodModel> get() async {
    return await repository.get(date: currentDate.value);
  }
}
