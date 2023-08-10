class AppConfig {
  /// 应用名称
  static const String appName = '应用名称';

  /// 应用版本号
  static const String appVersion = '1.0.1';

  /// 更新版本号
  static final double updateVersion =
      double.parse(appVersion.split('.').join());
}
