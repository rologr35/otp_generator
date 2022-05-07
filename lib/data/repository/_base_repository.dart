


import 'dart:io';

import '../remote/exceptions.dart';
import '../remote/result.dart';

class BaseRepository {
  ResultError<T> resultError<T>(dynamic ex) {
    String message = ex.toString();
    int code = -1;
    if (ex is ServerException) {
      message = ex.message;
      code = ex.statusCode;
    } else if (ex is SocketException) {
      message = "SocketException";
    }
    return Result.error(error: message, code: code);
  }
}
