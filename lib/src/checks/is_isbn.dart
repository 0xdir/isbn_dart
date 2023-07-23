import 'dart:core';
import '../converters/canonical_to_isbn.dart';
import 'digit.dart';

/// Checks if candidate is a valid ISBN 10
bool isISBN10(String candidate) {
  candidate = canonical(candidate);
  if (candidate.length != 10) {
    return false;
  }
  return checkDigit10(candidate.substring(0, 9)) == candidate[9];
}

/// Checks if candidate is a valid ISBN 13

bool isISBN13(String candidate) {
  candidate = canonical(candidate);
  if (candidate.length != 13) {
    return false;
  }
  if (candidate.substring(0, 3) != '978' &&
      candidate.substring(0, 3) != '979') {
    return false;
  }
  return checkDigit13(candidate.substring(0, 12)) == candidate[12];
}

/// Checks if candidate is NOT a valid ISBN
bool notISBN(String candidate, {required bool strict}) {
  candidate = canonical(candidate);

  if (candidate.length != 10 && candidate.length != 13) {
    return true;
  }

  if (strict == false) {
    return false;
  }

  if (candidate.length == 10) {
    return !isISBN10(candidate);
  }

  return !isISBN13(candidate);
}
