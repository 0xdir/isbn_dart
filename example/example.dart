import 'package:isbn/isbn.dart';

/// This example illustrates the main features of the library
///
/// For more examples, look at /tests
void main() {
  /// Initialize the main object
  Isbn isbn = Isbn();

  /// Check if a string is in ISBN-10 format
  print(isbn.isIsbn10('ISBN 4-19-830127-1'));

  /// Check if a string is in ISBN-13 format
  print(isbn.isIsbn13('ISBN 97818nope4677'));

  /// Convert a string into ISBN 10 format
  print(isbn.toIsbn10('isbn 0-8264-9752-7'));

  /// Convert a string into ISBN 13 format
  print(isbn.toIsbn13('record: isbn 0-8264-9752-7'));

  /// Parse text for ISBNs
  /// Specify detection levels to use. Options: [loose, normal, strict]
  final text = r'ISBN 9781849284677'
      'data: 9780312640583 thisworks'
      'record: isbn 978-0312640583'
      'also works: isbn 978031264058 3';
  print(isbn.getIsbnFromString(text, level: 'normal'));

  /// Convert a string to its canonical ISBN representation
  print(isbn.toCanonical('978-03126-4058-3'));

  /// Convert convert a string to EAN13 format
  print(isbn.toEAN13('978-03126-4058-3'));
}
