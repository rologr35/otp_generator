
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_generator/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../data/remote/result.dart';
import '../res/R.dart';

class ErrorHandlerBloC {
  final BehaviorSubject<String?> _errorMessageController = BehaviorSubject();

  Stream<String?> get errorMessageStream => _errorMessageController.stream;

  void showErrorMessage(Result res, {textColor, backgroundColor = Colors.redAccent, bool showMessageOnCancel = false}) {
    String errorMessage = (res as ResultError).error;
    if(!showMessageOnCancel && errorMessage.contains("DioErrorType.cancel")){
      return;
    }
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        textColor: textColor ?? R.color.whiteColor,
        backgroundColor: Colors.redAccent);
  }

  void showErrorMessageFromString(String errorMessage) {
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        textColor: R.color.whiteColor,
        backgroundColor: Colors.redAccent);
  }

  onError(dynamic error) {
    if (error != null) {
      _errorMessageController.sinkAddSafe(getResponseError(error));
    } else {
      clearError();
    }
  }

  String getResponseError(dynamic error) {
//    if (error is SocketException) {
//      return R.string.error_check_your_connection;
//    }
//    if (error is ServerException) {
//      return error.message;
//    } else {
//      return error.toString();
//    }
    return error.toString();
  }

  clearError() {
    _errorMessageController.sinkAddSafe(null);
  }

  void disposeErrorHandlerBloC() {
//    print('Error Handler Dispose');
    _errorMessageController.close();
  }
}
