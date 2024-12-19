import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_date_format.dart';
import 'package:teste_apod/app/core/widgets/apod_details/widgets/apod_favorite_widget.dart';
import 'package:teste_apod/app/core/widgets/apod_details/widgets/apod_image_widget.dart';
import 'package:teste_apod/app/core/widgets/apod_details/widgets/apod_video_widget.dart';

class ApodDetailWidget extends StatelessWidget {
  final ApodModel value;
  final bool showDate;

  const ApodDetailWidget({
    super.key,
    required this.value,
    this.showDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showDate)
            Card(
              margin: EdgeInsets.zero,
              child: information(
                title: 'Data',
                value: AppDateFormat.dateToStringFormat(value: value.date),
              ),
            ),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                information(title: 'Título', value: value.title),
                const Divider(height: 0),
                information(
                  title: 'Descrição',
                  value: value.explanation,
                ),
              ],
            ),
          ),
          if (value.isImage) ApodImageWidget(value: value),
          if (value.isVideo) ApodVideoWidget(value: value),
          ApodFavoriteWidget(value: value),
        ],
      ),
    );
  }

  Widget information({
    required String title,
    required String value,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: ReadMoreText(
        value,
        trimLines: 8,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Mostrar mais',
        trimExpandedText: 'Mostrar menos',
        moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        lessStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text(value),
    );
  }
}
