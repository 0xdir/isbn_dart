import '../regex/regex.dart';

/// Cleans candidate for legal ISBIN characters
String cleanCandidate(String candidate) {
  String cisbn =
      candidate.split('').where((c) => legalCharacters.contains(c)).join();

  String buf = cisbn.replaceAll(RegExp(r'\s*-\s*'), '-');
  return buf.replaceAll(RegExp(r'\s+'), ' ').trim();
}
