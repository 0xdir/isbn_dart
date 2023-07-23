import '../regex/regex.dart';

/// Check if candidate contains an ISBN10 substring
bool checkStructure10(String candidate) {
  return reIsbn10.hasMatch(candidate);
}

/// Check if candidate contains an ISBN13 substring
bool checkStructure13(String candidate) {
  return reIsbn13.hasMatch(candidate);
}
