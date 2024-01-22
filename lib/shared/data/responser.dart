class Responser<T> {
  final String? message;
  final bool isSuccess;
  final T? data;

  Responser({
    required this.isSuccess,
    this.message,
    this.data,
  });
}
