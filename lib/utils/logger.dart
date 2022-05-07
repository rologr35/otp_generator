
import 'dart:developer' as dev;

///Logger interface used to print logs or not depending the current debug level.
abstract class Logger {
  log(Object message);
}

class LoggerImpl implements Logger {
  @override
  log(Object message) {
    dev.log(message.toString(), time: DateTime.now());
  }
}
