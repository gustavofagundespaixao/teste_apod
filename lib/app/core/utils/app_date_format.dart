import 'package:intl/intl.dart';

const _locale = 'pt-br';

class AppDateFormat {
  static String dateToStringFormat({
    required DateTime value,
    String format = 'dd/MM/yyyy',
  }) {
    return DateFormat(format, _locale).format(value);
  }
}
