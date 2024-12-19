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
    return Column(
      spacing: 6,
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(ImagePage.routeName, arguments: value.url);
            },
            child: Hero(
              tag: value.url,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: value.url,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  scale: 16 / 9,
                  progressIndicatorBuilder: (context, url, progress) {
                    return AppLoadingWidget();
                  },
                ),
              ),
            ),
          ),
        ),
        const Text(
          'Clique na imagem para abrir em tela cheia',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
