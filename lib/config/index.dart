enum BuildFlavor { dev, prop }

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  // 单例模式使用Http类
  factory AppConfig() => _instance;

  static late final BuildFlavor flavorName;
  static late final String apiBaseUrl;
  static late final String appName;

  AppConfig._internal() {
    // 单例中的默认设置
  }

  void init({
    required BuildFlavor flavor,
    required String baseUrl,
    required String name
  }) {
    flavorName = flavor;
    apiBaseUrl = baseUrl;
    appName = name;
  }
}