// ignore_for_file: implementation_imports

import 'package:dio/src/response.dart';
import 'package:teste_apod/app/core/client/app_client.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:teste_apod/app/core/utils/app_date_format.dart';

class ApodRepository {
  final AppClient _appClient;

  ApodRepository(this._appClient);

  Future<ApodModel> get({required DateTime date}) async {
    final Response result = await _appClient.get(
      path: 'apod',
      queryParameters: {
        'date': AppDateFormat.dateToStringFormat(
          value: date,
          format: 'yyyy-MM-dd',
        ),
      },
    );

    if (result.statusCode == 200) {
      return ApodModel.fromMap(result.data);
    } else {
      throw result.statusCode!;
    }
  }
}
