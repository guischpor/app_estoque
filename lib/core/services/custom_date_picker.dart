import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CustomDatePicker {
  DateTime date = DateTime.now();

  Future selectDate({
    required BuildContext context,
    required TextEditingController controller,
    required String format,
    String? dataInicio,
    String? dataFinal,
  }) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
    );

    if (newDate == null) return;

    switch (format) {
      case 'date':
        date = newDate;
        return controller.text = formatDateToString(date, format);
      case 'day':
        date = newDate;
        return controller.text = formatDateToString(date, format);
      case 'month':
        date = newDate;
        return controller.text = formatDateToString(date, format);
      case 'format_us':
        date = newDate;
        return controller.text = formatDateToString(date, format);
      case 'no_format':
        date = newDate;
        return controller.text = date.toString();
      default:
        return 'O formato está incorreto $format';
    }
  }

  String formatDateToString(DateTime date, String format) {
    switch (format) {
      case 'date':
        return DateFormat('dd/MM/yyyy').format(date);
      case 'day':
        return DateFormat("dd").format(date);
      case 'month':
        return DateFormat("MM/yyyy").format(date);
      case 'format_us':
        return DateFormat("yyyy-MM-dd").format(date);
      default:
        return 'O formato está incorreto $format';
    }
  }
}
