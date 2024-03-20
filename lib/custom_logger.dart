import 'package:logger/logger.dart' as log;

class AnyModeFilter extends log.LogFilter {
  @override
  bool shouldLog(log.LogEvent event) {
    return true;
  }
}

class CustomLogger {
  String? loggerName;

  factory CustomLogger(String loggerName, log.LogOutput? output) {
    _customLogger.loggerName ??= loggerName;
    _customLogger.internalLogger = log.Logger(
      printer: log.SimplePrinter(printTime: true),
      output: output ?? log.ConsoleOutput(),
    );
    return _customLogger;
  }

  CustomLogger._internal();

  static final CustomLogger _customLogger = CustomLogger._internal();

  late final log.Logger internalLogger;

  void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.t('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.d('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.i('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.w('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.e('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }

  void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    internalLogger.f('$loggerName: $message',
        error: error, stackTrace: stackTrace);
  }
}
