import '../regex/regex.dart';

/// Determines patterns to match against
RegExp getIsbnLikePattern(String level) {
  switch (level.toLowerCase()) {
    case 'normal':
      return reNormal;
    case 'strict':
      return reStrict;
    case 'loose':
      return reLoose;
    default:
      throw ArgumentError('Level Error: $level should be '
          'one of : [normal, strict, loose]');
  }
}

/// Matches against patterns
List<String> getIsbnLike(
  String text, {
  String level = 'normal',
}) {
  RegExp isbnlikePattern = getIsbnLikePattern(level);
  return isbnlikePattern
      .allMatches(text)
      .map((match) => match.group(0)!)
      .toList();
}
