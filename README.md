[![pub package](https://img.shields.io/pub/v/isbn.svg)](https://pub.dev/packages/isbn)
[![package publisher](https://img.shields.io/pub/publisher/isbn.svg)](https://pub.dev/packages/isbn/publisher)


A library for parsing, validating, and generating ISBN codes easily. 
Supports ISBN-10 and ISBN-13 formats.

This library is designed to have minimal dependencies for use across multiple platforms. 

## Using

The easiest way to use this library is via the top-level ```Isbn``` class.

```dart
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

  /// Convert a string to EAN13 format
  print(isbn.toEAN13('978-03126-4058-3'));
}
```

## On ISBNs

ISBN stands for International Standard Book Number. It is a unique identifier used for books 
and other related products like e-books, audiobooks, and certain multimedia publications. 

ISBNs are used to uniquely identify a specific edition or format of a book and are an 
essential part of the book supply chain and publishing industry.

The standard ISBN format is now 13 digits. However, the older ISBN-10 system is still 
encountered in some older publications. The ISBN-10 system was in use until 2007, after which the 
ISBN-13 system became the standard. 

The ISBN-13 format is also known as EAN-13 (European Article Number), as it shares the 
same structure with EAN-13 barcodes used for other retail products.

## Getting Help

Submit an issue on [github](https://github.com/0xdir/isbn_dart).


## This work builds upon:
1. [xlcnd's isbnlib (python)](https://github.com/xlcnd/isbnlib)

Do check out their repo too!

## How to contribute

All feedback and suggestions for improvements are welcome:

1. Open a discussion on [github](https://github.com/0xdir/isbn_dart)
2. Discuss proposed changes
3. Submit a PR (optional)

## Support my work

This package is possible thanks to the people and companies
who donate money, services or time to keep the project running.

If you're interested in becoming a Sponsor, Backer or Contributor
to expand the project, please visit my [github sponsors page](https://github.com/sponsors/0xdir).

Or buy me coffee at `0xdir.near`.