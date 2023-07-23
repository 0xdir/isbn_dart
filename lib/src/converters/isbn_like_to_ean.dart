import '../checks/is_isbn.dart';
import 'canonical_to_isbn.dart';
import 'to_isbn.dart';

/// Convert candidate into ean13 format
String ean13(String candidate) {
  candidate = canonical(candidate);
  if (candidate.length == 13) {
    return (isISBN13(candidate)) ? candidate : '';
  } else if (candidate.length == 10) {
    return (isISBN10(candidate)) ? toISBN13(candidate) : '';
  }
  return '';
}
