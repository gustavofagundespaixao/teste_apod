import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:teste_apod/app/core/widgets/app_loading_widget.dart';

class ImagePage extends GetView {
  static String routeName = '/image';

  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagem'),
      ),
      body: Center(
        child: Hero(
          tag: Get.arguments,
          child: PhotoViewGallery.builder(
            itemCount: 1,
            loadingBuilder: (context, event) {
              return AppLoadingWidget();
            },
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(Get.arguments),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered,
              );
            },
            scrollPhysics: BouncingScrollPhysics(),
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
            pageController: PageController(),
          ),
        ),
      ),
    );
  }
}
