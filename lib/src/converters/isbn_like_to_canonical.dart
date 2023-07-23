import '../checks/digit.dart';
import '../regex/regex.dart';
import 'canonical_to_isbn.dart';
import 'to_isbn.dart';

/// Convert candidate to canonical format
String getCanonicalISBN(String candidate, {String output = 'both'}) {
  if (output != 'both' && output != 'isbn10' && output != 'isbn13') {
    return '';
  }

  RegExp regex = reNormal;
  Match? match = regex.firstMatch(candidate);

  if (match != null) {
    String cisbn = canonical(match.group(0)!);
    if (cisbn.isEmpty) {
      return '';
    }
    List<String> chars = cisbn.split('');
    String last = chars.removeLast();
    String buf = chars.join();

    if (chars.length == 9) {
      String check = checkDigit10(buf);
      if (check == last) {
        if (output == 'both') {
          return cisbn;
        }
        if (output == 'isbn10') {
          return (cisbn.length == 10) ? cisbn : toISBN10(cisbn);
        }
        return (cisbn.length == 10) ? toISBN13(cisbn) : cisbn;
      }
    } else {
      String check = checkDigit13(buf);
      if (check == last) {
        if (output == 'both') {
          return cisbn;
        }
        if (output == 'isbn10') {
          return (cisbn.length == 10) ? cisbn : toISBN10(cisbn);
        }
        return (cisbn.length == 10) ? toISBN13(cisbn) : cisbn;
      }
    }
  }
  return '';
}
