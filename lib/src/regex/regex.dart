import 'dart:core';

/// Regex to detect ISBN10 format
final RegExp reIsbn10 = RegExp(r'ISBN\x20(?=.{13}$)\d{1,5}([- ])\d{1,7}'
    r'\1\d{1,6}\1(\d|X)$|[- 0-9X]{10,16}');

/// Regex to detect ISBN13 format
final RegExp reIsbn13 =
    RegExp(r'97[89]{1}(?:-?\d){10,16}|97[89]{1}[- 0-9]{10,16}');

/// Regex to detect ISBN format with the highest sensitivity
final RegExp reStrict = RegExp(
  r'^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|'
  r'(?=(?:[0-9]+[- ]){3})'
  r'[- 0-9X]{13}$|97[89][0-9]{10}$|'
  r'(?=(?:[0-9]+[- ]){4})'
  r'[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}'
  r'[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$',
  multiLine: true,
  caseSensitive: false,
  dotAll: true,
);

/// Regex to detect ISBN format
final RegExp reNormal = RegExp(
  r'97[89]{1}-?[0-9]{10}|'
  r'97[89]{1}-[-0-9]{13}|'
  r'\d{9}[0-9X]{1}|'
  r'[-0-9X]{10,16}',
  multiLine: true,
  caseSensitive: false,
  dotAll: true,
);

/// Regex to detect informal ISBIN format
final RegExp reLoose = RegExp(
  r'[- 0-9X]{10,19}',
  multiLine: true,
  caseSensitive: false,
  dotAll: true,
);

/// Constant for ISBN prefixes
final String isbn13Prefix = '978';

/// Constant for Legal ISBN characters
final String legalCharacters = '0123456789xXisbnISBN- ';
