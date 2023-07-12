import 'package:logger/logger.dart' as log;

class AnyModeFilter extends log.LogFilter {
  @override
  bool shouldLog(log.LogEvent event) {
    return true;
  }
}

class CustomLogger {
  final String loggerName;

  factory CustomLogger(String loggerName) {
    _customLogger = CustomLogger._internal(loggerName);
    return _customLogger;
  }

  CustomLogger._internal(this.loggerName);

  static late final CustomLogger _customLogger;

  log.Logger internalLogger = log.Logger(
    printer: log.SimplePrinter(printTime: true),
    output: log.ConsoleOutput(),
  );

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.v('$loggerName: $message', error, stackTrace);
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.d('$loggerName: $message', error, stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.i('$loggerName: $message', error, stackTrace);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.w('$loggerName: $message', error, stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.e('$loggerName: $message', error, stackTrace);
  }

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.wtf('$loggerName: $message', error, stackTrace);
  }
}
