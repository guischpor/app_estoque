import 'package:intl/intl.dart';
import '../app_consts/app_consts.dart';

extension StringExtensionNull on String? {
  bool isTrimEmptyOrNull() {
    return this == null || this!.trim().isEmpty;
  }

  T? stringToEnum<T extends Enum>(List<T> values) {
    final parsed = values.map((e) => e.toString()).toList();
    final index = parsed.indexOf(toString());
    if (index == -1) {
      return null;
    } else {
      return values[index];
    }
  }
}

extension StringExtension on String {
  DateTime stringDDMMYYYYToDate() {
    final split = this.split('/');
    assert(split.length == 3);
    final splitInt = split.map((e) => int.parse(e)).toList();
    return DateTime(splitInt[2], splitInt[1], splitInt[0]);
  }
}

extension StringExtensionBrackets on String {
  String removeBrackets() {
    final brackets = replaceAll('(', '').replaceAll(')', '');
    return brackets;
  }
}

extension StringExtexionSquareBrackets on String {
  String removeSquareBrackets() {
    final squareBrackets = replaceAll('[', '').replaceAll(']', '');
    return squareBrackets;
  }
}

extension StringExtensionDot on String {
  String removeCommaAndDots() {
    final commaAndDot = toString().replaceAll(',', '').replaceAll('.', '');
    return commaAndDot;
  }
}

extension StringExtensionPhone on String {
  String removeFormatPhone() {
    final commaAndDot = toString()
        .replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '');
    return commaAndDot;
  }
}

extension StringExtensionCep on String {
  String removeFormatCep() {
    final commaAndDot = toString().replaceAll('-', '');
    return commaAndDot;
  }
}

extension StringExtensionCpfOrCnpj on String {
  String removeFormatCpfOrCnpj() {
    final commaAndDot = toString()
        .replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '');
    return commaAndDot;
  }
}

extension StringExtensionBRL on String {
  String formatCurrencyBRL() {
    final formatCurrency =
        NumberFormat.currency(locale: "pt_Br", symbol: 'R\$');
    final result = formatCurrency.format(double.parse(this));
    return result;
  }
}

extension StringExtensionNotBRL on String {
  String formatCurrencyNotBRL() {
    final formatCurrency = NumberFormat.currency(locale: "pt_Br", symbol: '');
    final result = formatCurrency.format(double.parse(this));
    return result;
  }
}

extension ObjectExtension on Object? {
  // String? enumToString() {
  //   if (this == null) return null;
  //   final list = this.toString().split('.');
  //   assert(list.length > 1);
  //   return this.toString().split('.')[1];
  // }
}

extension EnumExtension on Enum? {
  String? enumToString() {
    if (this == null) return null;
    final list = toString().split('.');
    assert(list.length > 1);
    return toString().split('.')[1];
  }
}

extension MapExtension on Map {
  addEntrieIfValueNotNull(dynamic key, dynamic value) {
    if (value == null) return;
    if (value is String && value.trim().isEmpty) return;
    this[key] = value;
  }

  double? tryParseValueToDoble(key) {
    if (this[key] == null) return null;
    if (this[key] is double) return this[key];
    return double.tryParse(this[key].toString());
  }

  DateTime? tryParseValueToDateTime(key) {
    if (this[key] == null) return null;
    if (this[key] is DateTime) return this[key];
    return DateTime.tryParse(this[key].toString());
  }
}

extension DoubleExtension on double {
  String toStringBrazilMoney({
    String prefixSybols = 'R\$ ',
    bool withPoints = true,
  }) {
    String stringComma = toStringAsFixed(2).replaceAll('.', ',');
    final lenght = stringComma.length;
    if (lenght > 6) {
      final subStringStart = stringComma.substring(0, lenght - 6);
      final subStringLast = stringComma.substring(lenght - 6);
      stringComma = '$subStringStart.$subStringLast';
    }
    return prefixSybols + stringComma;
  }
}

extension DoubleExtensionMoney on double {
  String toStringBrazilMoneyNotPrefix({
    bool withPoints = true,
  }) {
    String stringComma = toStringAsFixed(2).replaceAll('.', ',');
    final lenght = stringComma.length;
    if (lenght > 6) {
      final subStringStart = stringComma.substring(0, lenght - 6);
      final subStringLast = stringComma.substring(lenght - 6);
      stringComma = '$subStringStart.$subStringLast';
    }
    return stringComma;
  }
}

extension DateTimeExtension on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) =>
      DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond,
      );

  String toStringDDMMYYYY({String separator = '/'}) {
    String month = this.month.toString().length == 1
        ? '0${this.month}'
        : this.month.toString();
    String day =
        this.day.toString().length == 1 ? '0${this.day}' : this.day.toString();
    return '$day$separator$month$separator$year';
  }

  String toStringYYYYMMDD({String separator = '/'}) {
    String month = this.month.toString().length == 1
        ? '0${this.month}'
        : this.month.toString();
    String day =
        this.day.toString().length == 1 ? '0${this.day}' : this.day.toString();
    return '$year$separator$month$separator$day';
  }

  String toStringHHMM({String pattern = 'HH:mm'}) {
    return DateFormat(pattern).format(this);
  }

  String toStringDDMMYYHHMM({String pattern = 'dd/MM/yy HH:mm'}) {
    return DateFormat(pattern).format(this);
  }

  String toWeekDay() {
    switch (DateFormat('EEE').format(this)) {
      case 'Mon':
        return 'Seg';
      case 'Tue':
        return 'Ter';
      case 'Wed':
        return 'Qua';
      case 'Thu':
        return 'Qui';
      case 'Fri':
        return 'Sex';
      case 'Sat':
        return 'Sab';
      case 'Sun':
        return 'Dom';
      default:
        return 'Not';
    }
  }

  String monthToString() => AppConst.months[month - 1];

  DateTime justDate() => DateTime(year, month, day);

  List<DateTime> daysOfMonth({bool noPastDays = false}) {
    final firstDay = DateTime(year, month, 1);
    List<DateTime> list = [];
    for (var i = 0; i < 35; i++) {
      final date = firstDay.add(Duration(days: i));
      if ((!noPastDays ||
              (DateTime.now().isBefore(date) ||
                  DateTime.now().day == date.day)) &&
          date.month == month) list.add(date);
    }
    return list;
  }

  bool isBetween(DateTime date1, DateTime date2) {
    if (date1.isBefore(date2)) {
      return isAfter(date1) && isBefore(date2);
    } else if (date2.isBefore(date1)) {
      return isAfter(date2) && isBefore(date1);
    }
    return false;
  }

  bool isToday() {
    return DateTime.now().justDate() == justDate();
  }
}
