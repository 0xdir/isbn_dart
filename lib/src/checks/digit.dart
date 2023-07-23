/// Extracts check digit from 10 digit candidate
String checkDigit10(String firstNineDigits) {
  /// Check if candidate is 10 digits
  if (firstNineDigits.length != 9) {
    return '';
  }

  try {
    int.parse(firstNineDigits);
  } catch (e) {
    return '';
  }

  /// ISBN10 validation
  int val = 0;
  for (int i = 0; i < firstNineDigits.length; i++) {
    int x = int.parse(firstNineDigits[firstNineDigits.length - 1 - i]);
    val += (i + 2) * x;
  }

  int remainder = val % 11;
  int tenthDigit = (remainder == 0) ? 0 : 11 - remainder;
  if (tenthDigit == 10) {
    return 'X';
  }

  return tenthDigit.toString();
}

/// Extracts check digit from 10 digit candidate
String checkDigit13(String firstTwelveDigits) {
  /// Check if candidate is 10 digits
  if (firstTwelveDigits.length != 12) {
    return '';
  }

  try {
    int.parse(firstTwelveDigits);
  } catch (e) {
    return '';
  }

  /// ISBN13 validation
  int val = 0;
  for (int i = 0; i < firstTwelveDigits.length; i++) {
    int x = int.parse(firstTwelveDigits[i]);
    val += (i % 2 * 2 + 1) * x;
  }

  int thirteenthDigit = 10 - val % 10;
  if (thirteenthDigit == 10) {
    thirteenthDigit = 0;
  }

  return thirteenthDigit.toString();
}
