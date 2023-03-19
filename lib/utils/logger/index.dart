import 'package:logger/logger.dart';

class Console {
  // 单例生命。
  factory Console() => _instance;

  Console._internal();

  static final Console _instance = Console._internal();

  static late final Logger _console;

  /// 初始化方法，只调用一次
  Console init() {
    _console = Logger(
        printer: PrettyPrinter(
            methodCount: 2, // number of method calls to be displayed 要展示的方法调用的数量
            errorMethodCount: 8, // number of method calls if stacktrace is provided 如果提供了 stacktrace，方法调用的数量
            lineLength: 120, // width of the output 输出的宽度
            colors: true, // Colorful log messages 是否带颜色输出日志信息
            printEmojis: true, // Print an emoji for each log message 为每个日志信息打印颜文字
            printTime: false // Should each log print contain a timestamp 是否每一个日志打印包含一个时间戳
        ),
    );
    return _instance;
  }

  static log(dynamic message) {
    _console.i(message);
  }
}