/// Enum to define Application Environment instance
enum Environment { DEV, STAGING, PROD }

class EnvironmentConstants {
  static String? _config;

  /// method to set environment
  static String setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config ="https://api.pexels.com/";
        break;
      case Environment.STAGING:
        _config = "https://api.pexels.com/";
        break;
      case Environment.PROD:
        _config = "https://api.pexels.com/";
        break;
    }
    return _config!;
  }


}

