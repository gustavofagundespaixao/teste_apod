import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/widgets/app_loading_widget.dart';
import 'package:teste_apod/app/modules/image/image_page.dart';

class ApodImageWidget extends StatelessWidget {
  final ApodModel value;

  const ApodImageWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: InkWell(
        onTap: () {
          Get.toNamed(ImagePage.routeName, arguments: value.url);
        },
        child: Hero(
          tag: value.url,
          child: CachedNetworkImage(
            scale: 16 / 9,
            imageUrl: value.url,
            progressIndicatorBuilder: (context, url, progress) {
              return AppLoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
