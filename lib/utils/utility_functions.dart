import 'package:intl/intl.dart';

/// Adds thousand separators to a given numeric string.
///
/// This function takes a string representation of a number and formats it by
/// inserting commas as thousand separators to enhance readability. It uses a
/// regular expression to match each group of three digits not followed by
/// another digit, starting from the right (least significant digits).
///
/// Example:
/// ```dart
/// final formattedNumber = addThousandSeparator("1234567");
/// print(formattedNumber); // Outputs: 1,234,567
/// ```
///
/// - Parameters:
///   - value: A `String` representing the numeric value to be formatted.
/// - Returns: A `String` with commas added as thousand separators.
String addThousandSeparator(String value) {
  return value.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]},',
  );
}

/// Converts hours into a more readable time format.
///
/// This function takes a string representation of hours and converts it into a more
/// human-readable format, expressing the time in minutes, hours, days, weeks, or months
/// depending on the duration. The conversion is based on the following rules:
/// - Less than 1 hour is converted to minutes (e.g., "30m").
/// - Less than 24 hours but at least 1 hour is kept in hours (e.g., "12h").
/// - Less than 168 hours (1 week) but at least 24 hours is converted to days (e.g., "3d").
/// - Less than 720 hours (1 month) but at least 168 hours is converted to weeks (e.g., "2w").
/// - 720 hours or more is converted to months (e.g., "1mo").
///
/// Note: The function assumes a month is exactly 720 hours (30 days).
///
/// - Parameters:
///   - hours: A `String` representing the number of hours.
/// - Returns: A `String` representing the time in a more readable format, using
///   the smallest unit that results in a value greater than 1.
String convertToReadableTime(String hours) {
  final int _hours = int.parse(hours);
  final int _seconds = _hours * 3600;
  final int _minutes = _hours * 60;
  final int _days = _hours ~/ 24;
  final int _weeks = _hours ~/ 168;
  final int _months = _hours ~/ 720;

  if (_hours < 1) {
    return "${_minutes}m";
  } else if (_hours < 24) {
    return "${_hours}h";
  } else if (_hours < 168) {
    return "${_days}d";
  } else if (_hours < 720) {
    return "${_weeks}w";
  } else {
    return "${_months}mo";
  }
}

String convertToReadableTimeExtended(String hours) {
  final int _hours = int.parse(hours);
  final int _seconds = _hours * 3600;
  final int _minutes = _hours * 60;
  final int _days = _hours ~/ 24;
  final int _weeks = _hours ~/ 168;
  final int _months = _hours ~/ 720;

  if (_hours < 1) {
    return "${_minutes} minute(s)";
  } else if (_hours < 24) {
    return "${_hours} hour(s)";
  } else if (_hours < 168) {
    return "${_days} day(s)";
  } else if (_hours < 720) {
    return "${_weeks} week(s)";
  } else {
    return "${_months} month(s)";
  }
}

/// Returns a string representation of the month and year of a given date.
///
/// This function formats a [DateTime] object into a string that only includes
/// the month and the year, using the format "MMM yyyy" (e.g., "Jan 2023").
/// It utilizes the `DateFormat` class from the `intl` package to perform
/// the formatting.
///
/// Example:
/// ```dart
/// final date = DateTime(2023, 1, 15);
/// final monthAndYear = getMonthAndYear(date);
/// print(monthAndYear); // Outputs: Jan 2023
/// ```
///
/// - Parameters:
///   - date: A [DateTime] object representing the date to be formatted.
/// - Returns: A [String] representing the formatted month and year.
String getMonthAndYear(DateTime date) {
  return DateFormat.yMMM().format(date);
}

/// Formats a given date into a string with the format "Day. Date Month Year".
///
/// This function takes a [DateTime] object and formats it into a string that
/// includes the abbreviated day of the week, the date, the abbreviated month,
/// and the full year. The format used is "E. d MMM y", where "E" stands for
/// the abbreviated day of the week (e.g., Mon), "d" for the date, "MMM" for
/// the abbreviated month (e.g., Jan), and "y" for the year.
///
/// Example:
/// ```dart
/// final date = DateTime(2023, 5, 15);
/// final formattedDate = getFormattedDate(date);
/// print(formattedDate); // Outputs: Mon. 15 May 2023
/// ```
///
/// - Parameters:
///   - date: A [DateTime] object representing the date to be formatted.
/// - Returns: A [String] representing the formatted date in the specified format.
String getFormattedDate(DateTime date) {
  return DateFormat('E. d MMM y').format(date);
}

// a function to remove beginning slash from a string
String removeBeginningSlash(String path) {
  return path.startsWith('/') ? path.substring(1) : path;
}