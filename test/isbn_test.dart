import 'package:isbn/isbn.dart';
import 'package:test/test.dart';

void main() {
  final Isbn isbn = Isbn();

  /// Test data
  final String isbns = r'ISBN 9781849284677'
      'qwe iuwer 9780312640583 kjhfds'
      'bh bh isbn 978-0312640583'
      'bh bh isbn 978 031264058 3'
      'bh bh isbn978 031264058 3'
      'ISBN 0-330-28498-3 jhjhISBN 1-58182-008-9'
      'ISBN 2-226-05257-7'
      'ISBN 3-7965-1900-8'
      'ISBN 4-19-830127-1'
      'ISBN 5-85270-001-0'
      'ISBN 978-600-119-125-1'
      'ISBN 978-601-7151-13-3'
      'ISBN 978-602-8328-22-7'
      'ISBN 978-603-500-045-1'
      'ISBN 605-384-057-2'
      'ISBN 978-606-8126-35-7'
      'ISBN 978-607-455-035-1'
      'ISBN 978-608-203-023-4'
      'ISBN 978-612-45165-9-7'
      'ISBN 978-614-404-018-8'
      'ISBN 978-615-5014-99-4'
      'ISBN 7-301-10299-2'
      'ISBN 80-85983-44-3'
      'ISBN 81-7215-399-6'
      'ISBN 82-530-0983-6'
      'ISBN 83-08-01587-5'
      'ISBN 84-86546-08-7'
      'ISBN 85-7531-015-1'
      'ISBN 86-341-0846-5'
      'ISBN 87-595-2277-1'
      'ISBN 88-04-47328-2'
      'ISBN 90-5691-187-2'
      'ISBN 91-1-811692-2'
      'ISBN 92-67-10370-9'
      'ISBN 93-8011-236-7'
      'ISBN 94-414-0063-3'
      'ISBN 950-04-0442-7'
      'ISBN 951-0-11369-7'
      'ISBN 952-471-294-6'
      'ISBN 953-157-105-8'
      'ISBN 954-430-603-X'
      'ISBN 955-20-3051-X'
      'ISBN 956-7291-48-9'
      'ISBN 957-01-7429-3'
      'ISBN 958-04-6278-X'
      'ISBN 959-10-0363-3'
      'ISBN 961-6403-23-0'
      'ISBN 962-04-0195-6'
      'ISBN 963-7971-51-3'
      'ISBN 964-6194-70-2'
      'ISBN 965-359-002-2'
      'ISBN 966-95440-5-X'
      'ISBN 967-978-753-2'
      'ISBN 968-6031-02-2'
      'ISBN 969-031-02-2'
      'ISBN 970-20-0242-7'
      'ISBN 971-8845-10-0'
      'ISBN 972-37-0274-6'
      'ISBN 973-43-0179-9'
      'ISBN 974-85854-7-6'
      'ISBN 975-293-381-5'
      'ISBN 976-640-140-3'
      'ISBN 977-734-520-8'
      'ISBN 978-37186-2-2'
      'ISBN 979-553-483-1'
      'ISBN 980-01-0194-2'
      'ISBN 981-3018-39-9'
      'ISBN 982-301-001-3'
      'ISBN 983-52-0157-9'
      'ISBN 984-458-089-7'
      'ISBN 986-417-191-7'
      'ISBN 987-98184-2-3'
      'ISBN 978-988-00-3827-3'
      'ISBN 978-9928400529'
      'ISBN 978-9929801646'
      'ISBN 978-9930943106'
      'ISBN 978-9933101473'
      'ISBN 978-9934015960'
      'ISBN 978-99937-1-056-1'
      'ISBN 978-99965-2-047-1';

  test('Should check Isbn10 candidates correctly', () {
    expect(isbn.isIsbn10('0826497527'), isTrue);
    expect(isbn.isIsbn10('isbn 0-8264-9752-7'), isTrue);
    expect(isbn.isIsbn10('0826497520'), isFalse);
    expect(isbn.isIsbn10('954430603X'), isTrue);
  });

  test('Should check Isbn13 candidates correctly', () {
    expect(isbn.isIsbn13('9780826497529'), isTrue);
    expect(isbn.isIsbn13('9791090636071'), isTrue);
    expect(isbn.isIsbn13('isbn 979-10-90636-07-1'), isTrue);
    expect(isbn.isIsbn13('9780826497520'), isFalse);
    expect(isbn.isIsbn13('9700000000000'), isFalse);
    expect(isbn.isIsbn13('9000000000000'), isFalse);
    expect(isbn.isIsbn13('9710000000000'), isFalse);
  });

  test('Should convert to Isbn10 correctly', () {
    expect(isbn.toIsbn10('9780826497529') == '0826497527', isTrue);
    expect(isbn.toIsbn10('0826497527') == '0826497527', isTrue);
    expect(isbn.toIsbn10('isbn 0-8264-9752-7') == '0826497527', isTrue);
    expect(isbn.toIsbn10('isbn 979-10-90636-07-1') == '', isTrue);
    expect(isbn.toIsbn10('isbn 978-0-8264-9752-9') == '0826497527', isTrue);
    expect(
        isbn.toIsbn10('asdadv isbn 978-0-8264-9752-9') == '0826497527', isTrue);

    /// Candidates below are not valid ISBNS
    expect(isbn.toIsbn10('9780826497520') == '', isTrue);
    expect(isbn.toIsbn10('9790826497529') == '', isTrue);
    expect(isbn.toIsbn10('97808264975X3') == '', isTrue);
    expect(isbn.toIsbn10('978-826497') == '', isTrue);
  });

  test('Should convert to Isbn13 correctly', () {
    expect(isbn.toIsbn13('0826497527') == '9780826497529', isTrue);
    expect(isbn.toIsbn13('9780826497529') == '9780826497529', isTrue);
    expect(isbn.toIsbn13('91-43-01019-9') == '9789143010190', isTrue);
    expect(isbn.toIsbn13('isbn 91-43-01019-9') == '9789143010190', isTrue);
    expect(
        isbn.toIsbn13('asd isbn 979-10-90636-07-1 blabla') == '9791090636071',
        isTrue);

    /// Candidates below are not valid ISBNs
    expect(isbn.toIsbn13('0826497520') == '', isTrue);
    expect(isbn.toIsbn13('08X6497527') == '', isTrue);
  });

  test('Should not generate Isbin', () {
    expect(isbn.notIsbn('0826497527', strict: true), isFalse);
    expect(isbn.notIsbn('0826497520', strict: true), isTrue);
    expect(isbn.notIsbn('9780826497529', strict: true), isFalse);
    expect(isbn.notIsbn('9426497529', strict: true), isTrue);
    expect(isbn.notIsbn('978082649752', strict: true), isTrue);
    expect(isbn.notIsbn('978082649752', strict: false), isTrue);
    expect(isbn.notIsbn('9780826400001', strict: false), isFalse);
    expect(isbn.notIsbn('9780826400001', strict: true), isTrue);
    expect(isbn.notIsbn('978 9426497529', strict: true), isTrue);
    expect(isbn.notIsbn('9789426497529', strict: true), isTrue);
    expect(isbn.notIsbn('979 10 9063607 1', strict: true), isFalse);
    expect(isbn.notIsbn('9780826497520', strict: true), isTrue);
  });

  test('Should extract Isbin like strings', () {
    expect(isbn.getIsbnFromString(isbns, level: 'normal').length, 79);
    expect(isbn.getIsbnFromString(isbns, level: 'loose').length, 81);
    // expect(isbn.getIsbnFromString(ISBNs, level: 'strict').length, 69);
    expect(isbn.getIsbnFromString('sss', level: 'normal'), []);
    expect(isbn.getIsbnFromString('978-0-9790173-4-6', level: 'normal')[0],
        '978-0-9790173-4-6');
    expect(isbn.getIsbnFromString('978-9788461784', level: 'normal')[0],
        '978-9788461784');
  });

  test('Should get canonical ISBN', () {
    expect(isbn.getCanonical('0826497527', output: 'both'), '0826497527');
    expect(isbn.getCanonical('0826497527', output: 'isbn10'), '0826497527');
    expect(isbn.getCanonical('0826497527', output: 'isbn13'), '9780826497529');
    expect(isbn.getCanonical('ISBN 0826497527', output: 'isbn13'),
        '9780826497529');
    expect(isbn.getCanonical('ISBN 0826497527', output: 'ERR'), '');
    expect(isbn.getCanonical('0826497520', output: 'both'), '');
    expect(isbn.getCanonical('9780826497529', output: 'both'), '9780826497529');
    expect(isbn.getCanonical('9780826497520', output: 'both'), '');
    expect(isbn.getCanonical('OSX 9780826497529.pdf', output: 'both'),
        '9780826497529');

    /// invalid ISBN 13
    expect(isbn.getCanonical('9789720404427'), '');
    expect(isbn.getCanonical('isbn 9789720404427'), '');
    expect(isbn.getCanonical('ISBN 9789720404427'), '');

    /// valid ISBNs
    expect(isbn.getCanonical('ISBN-9780826497529'), '9780826497529');
    expect(isbn.getCanonical('ISBN9780826497529'), '9780826497529');
    expect(isbn.getCanonical('isbn9780826497529'), '9780826497529');
    expect(isbn.getCanonical('isbn 0826497527'), '0826497527');
    expect(isbn.getCanonical('ISBN 0826497527'), '0826497527');
    expect(isbn.getCanonical('ISBN-0826497527'), '0826497527');
    expect(isbn.getCanonical('954430603x'), '954430603X');
    expect(isbn.getCanonical('95443060x3'), '');
    expect(isbn.getCanonical('0000000000'), '');
    expect(isbn.getCanonical('000000000X'), '');
    expect(isbn.getCanonical('0000000000000'), '');
    expect(isbn.getCanonical('0000000'), '');
    expect(isbn.getCanonical(''), '');
  });

  test('Should convert to ean13', () {
    expect(isbn.toEAN13('ISBN 9789720404427'), '');
    expect(isbn.toEAN13('9700000000000'), '');
    expect(isbn.toEAN13('9000000000000'), '');
    expect(isbn.toEAN13('9710000000000'), '');
    expect(isbn.toEAN13('ISBN 9789720404428'), '9789720404428');
    expect(isbn.toEAN13('ISBN-9780826497529'), '9780826497529');
    expect(isbn.toEAN13('ISBN9780826497529'), '9780826497529');
    expect(isbn.toEAN13('isbn9780826497529'), '9780826497529');
    expect(isbn.toEAN13('isbn 0826497527'), '9780826497529');
  });
}
