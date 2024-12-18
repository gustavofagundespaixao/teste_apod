import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_apod/app/core/controllers/favorite_controller.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_date_format.dart';
import 'package:teste_apod/app/core/widgets/apod_details/widgets/apod_image_widget.dart';
import 'package:teste_apod/app/core/widgets/apod_details/widgets/apod_video_widget.dart';

class ApodWidgetDetail extends StatefulWidget {
  final ApodModel value;
  final bool showDate;

  const ApodWidgetDetail({
    super.key,
    required this.value,
    this.showDate = false,
  });

  @override
  State<ApodWidgetDetail> createState() => _ApodWidgetDetailState();
}

class _ApodWidgetDetailState extends State<ApodWidgetDetail> {
  final FavoriteController _favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        information(
          contentPadding: const EdgeInsets.only(left: 16),
          title: 'Título',
          value: widget.value.title,
          trailing: Obx(
            () {
              final isFavorite = _favoriteController.items.indexWhere(
                    (element) {
                      return element.title == widget.value.title;
                    },
                  ) >=
                  0;

              return IconButton(
                onPressed: () {
                  if (isFavorite) {
                    _favoriteController.removeToFavorite(widget.value);
                  } else {
                    _favoriteController.addToFavorite(widget.value);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              );
            },
          ),
        ),
        if (widget.showDate)
          information(
            title: 'Data',
            value: AppDateFormat.dateToStringFormat(value: widget.value.date),
          ),
        information(title: 'Descrição', value: widget.value.explanation),
        SizedBox(height: 12),
        if (widget.value.isImage) ApodImageWidget(value: widget.value),
        if (widget.value.isVideo) ApodVideoWidget(value: widget.value),
      ],
    );
  }

  Widget information({
    required String title,
    required String value,
    EdgeInsetsGeometry? contentPadding,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: contentPadding,
      visualDensity: VisualDensity.compact,
      title: Text(title),
      subtitle: Text(value),
      trailing: trailing,
    );
  }
}
