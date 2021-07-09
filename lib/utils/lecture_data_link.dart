String convertLectureDataUrl(String data) {
  final regex = RegExp(
    r'(href|src)=\"(?<url>[^"]*)',
    multiLine: true,
    caseSensitive: false,
  );
  final match = regex.firstMatch(data);
  if (match != null) {
    return match.namedGroup('url');
  } else {
    print('no urls in the html');
    return null;
  }
}
