class AppConfig {
  static AppConfig? _instance;
  final String apiKey;
  final String baseUrl;
  final String token;

  AppConfig._internal(this.apiKey, this.baseUrl, this.token);
  
  static AppConfig get instance {
    if (_instance == null) {
      const String apiKey = String.fromEnvironment('API_KEY');
      const String baseUrl = String.fromEnvironment('BASE_URL');
      const String token = String.fromEnvironment('TOKEN');
      _instance = AppConfig._internal(apiKey, baseUrl, token);
      return _instance!;
    }
    return _instance!;
  }

}