class AppError implements Exception {
  final String? message;
  final int? statusCode;

  AppError({this.message = "something want wrong", this.statusCode = 500})
      : super();
}
