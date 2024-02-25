import 'package:intl/intl.dart';

class DateInputConverter {
  String format(String date) {
    var dateSplited = date.toString().split('/');
    var dateFormated = '${dateSplited[2]}-${dateSplited[1]}-${dateSplited[0]}';
    return dateFormated;
  }

  String formatReversed(String date, String separator) {
    var dateSplited = date.toString().split(separator);
    var dateFormated = '${dateSplited[2]}/${dateSplited[1]}/${dateSplited[0]}';
    return dateFormated;
  }

  String removeHoursInDate(String date) {
    DateTime data = DateTime.parse(date);
    DateFormat format = DateFormat('dd/MM/yyyy');
    String dateFormat = format.format(data);
    return dateFormat;
  }

  String convertStringToFormDate(String date) {
    var dateSplited = date.toString().split('/');
    var dateFormated = '${dateSplited[2]}-${dateSplited[1]}-${dateSplited[0]}';
    var format = DateTime.parse(dateFormated);
    return format.toIso8601String();
  }

  String formatDateUS(String date) {
    var dateSplited = date.toString().split('/');
    var dateFormated = '${dateSplited[2]}-${dateSplited[1]}-${dateSplited[0]}';
    return dateFormated;
  }
}
