import 'package:isbn/src/converters/isbn_like_to_canonical.dart';
import 'checks/is_isbn.dart';
import 'converters/isbn_like_to_ean.dart';
import 'converters/to_isbn.dart';
import 'helpers/get_isbn_like_from_substring.dart';

/// The main object
class Isbn {
  /// Check if a [candidate] string is in ISBN 10 format
  bool isIsbn10(String candidate) {
    return isISBN10(candidate);
  }

  /// Check if a [candidate] string is in ISBN 13 format
  bool isIsbn13(String candidate) {
    return isISBN13(candidate);
  }

  /// Convert a [candidate] string into ISBN 10 format
  String toIsbn10(String candidate) {
    return toISBN10(candidate);
  }

  /// Convert a [candidate] string into ISBN 13 format
  String toIsbn13(String candidate) {
    return toISBN13(candidate);
  }

  /// Check if a [candidate] string is NOT a valid ISBN
  bool notIsbn(String candidate, {required bool strict}) {
    return notISBN(candidate, strict: strict);
  }

  /// Extract ISBN like strings from [text]
  List<String> getIsbnFromString(
    /// The text to extract ISBNs from
    String text, {
    /// The [level] of matching.
    /// Options: [normal, strict, loose]
    /// Defaults to 'normal'
    required String level,
  }) {
    return getIsbnLike(text, level: level);
  }

  /// Convert a [candidate] string into canonical ISBN format
  /// Returns empty string if candidate is invalid
  String toCanonical(
    /// The [candidate] to parse
    String candidate, {
    /// The desired [output]. Options: [isbn10, isbn13, both].
    String output = 'both',
  }) {
    return getCanonicalISBN(candidate, output: output);
  }

  /// Convert a [candidate] string into EAN13 format
  String toEAN13(

      /// The candidate to parse
      String candidate) {
    return ean13(candidate);
  }
}
