import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otp_generator/app.dart';
import 'di/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();
  runZonedGuarded(() {
    runApp(
      const OtpGeneratorApp()
    );
  }, (error, stackTrace) async {
    Injector.instance.logger.log(error);
  });
}
