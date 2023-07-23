/// Convert canonical to ISBN format
String canonical(String candidate) {
  List<String> target =
      candidate.split('').where((c) => '0123456789Xx'.contains(c)).toList();

  if (target.isNotEmpty && target.last == 'x') {
    target[target.length - 1] = 'X';
  }

  String isbn = target.join();

  /// Handle edge cases
  if (isbn.isEmpty ||
      (isbn.length != 10 && isbn.length != 13) ||
      ['0000000000', '0000000000000', '000000000X'].contains(isbn) ||
      !(isbn.indexOf('X') == 9 || !isbn.contains('X')) ||
      isbn.contains('x')) {
    return '';
  }

  return isbn;
}
