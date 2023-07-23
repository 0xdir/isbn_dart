import '../checks/digit.dart';
import '../regex/regex.dart';
import 'canonical_to_isbn.dart';
import '../checks/is_isbn.dart';

/// Convert candidate to ISBN 10
String toISBN10(String candidate) {
  candidate = canonical(candidate);

  /// Not able to convert to canonical
  if (candidate == '') {
    return '';
  }

  if (candidate.substring(0, 3) != isbn13Prefix) {
    return (candidate.length == 10 && isISBN10(candidate)) ? candidate : '';
  }

  if (!isISBN13(candidate)) {
    return '';
  }
  String isbn10 = candidate.substring(3);
  String check = checkDigit10(isbn10.substring(0, 9));
  return (check.isNotEmpty) ? isbn10.substring(0, 9) + check : '';
}

/// Convert candidate to ISBN 13

String toISBN13(String candidate) {
  candidate = canonical(candidate);

  /// Not able to convert to canonical
  if (candidate == '') {
    return '';
  }

  if (candidate.length == 13 && isISBN13(candidate)) {
    return candidate;
  }

  if (!isISBN10(candidate)) {
    return '';
  }

  String isbn13 = isbn13Prefix + candidate.substring(0, 9);
  String check = checkDigit13(isbn13.substring(0, 12));
  return (check.isNotEmpty) ? isbn13.substring(0, 12) + check : '';
}
