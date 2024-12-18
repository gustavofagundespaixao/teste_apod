import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_apod/app/core/utils/app_date_format.dart';
import 'package:teste_apod/app/modules/home/home_controller.dart';

class HomeDateWidget extends StatelessWidget {
  const HomeDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          spacing: 12,
          children: [
            IconButton(
              onPressed: () {
                controller.previousDate();
              },
              icon: Icon(Icons.arrow_left),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.selectDate();
                },
                onLongPress: () {
                  controller.selectDateToday();
                },
                child: Text(
                  AppDateFormat.dateToStringFormat(
                    value: controller.currentDate.value,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: controller.currentDate.value
                      .isAfter(DateTime.now().add(const Duration(days: -1)))
                  ? null
                  : () {
                      controller.nextDate();
                    },
              icon: Icon(Icons.arrow_right),
            ),
          ],
        ),
      );
    });
  }
}
