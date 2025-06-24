class ResponseError extends Error {
  final String message;
  final int statusCode;
  ResponseError({required this.message, required this.statusCode});
  @override
  String toString() {
    return 'ResponseError: $message with status code $statusCode';
  }
}
