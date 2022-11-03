class GoogleUserNotFound implements Exception {
  const GoogleUserNotFound({this.errorMessage});

  final String? errorMessage;
}
