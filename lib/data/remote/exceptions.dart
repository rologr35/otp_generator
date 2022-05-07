class ServerException implements Exception {
  late String message;
  late int statusCode;

  ServerException({required this.message, required this.statusCode});

  ServerException.fromJson(Map<String, dynamic> json) {
    statusCode = json["statusCode"];
    message = json["message"];
  }
}
