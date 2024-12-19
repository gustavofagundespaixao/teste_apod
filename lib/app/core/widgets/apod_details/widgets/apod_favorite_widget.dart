import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_apod/app/core/controllers/favorite_controller.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';

class ApodFavoriteWidget extends StatelessWidget {
  final ApodModel value;
  ApodFavoriteWidget({super.key, required this.value});

  final FavoriteController _favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final isFavorite = _favoriteController.items.indexWhere(
              (element) {
                return element.title == value.title;
              },
            ) >=
            0;

        if (isFavorite) {
          return ElevatedButton.icon(
            onPressed: () {
              _favoriteController.removeToFavorite(value);
            },
            label: const Text('Remover dos favoritos'),
            icon: Icon(Icons.delete, color: Colors.red.shade900),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
            ),
          );
        } else {
          return ElevatedButton.icon(
            onPressed: () {
              _favoriteController.addToFavorite(value);
            },
            label: const Text('Adicionar aos favoritos'),
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
          );
        }
      },
    );
  }
}
