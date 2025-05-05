import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:filme_flix/utils/app_config.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {
        'Authorization': 'Bearer ${AppConfig.instance.token}',
        'Content-Type': 'application/json;charset=utf-8',
      },
      queryParameters: {
        'language': 'pt-BR',
      },
    ),
    
  )..httpClientAdapter = _createDebugAdapter();

  static _createDebugAdapter() {
    if (!kDebugMode) {
      return;
    }
    String proxy = Platform.isAndroid ? '192.168.1.138:9090' : 'localhost:9090';
    return IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
            return 'PROXY $proxy';
          };
        client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        return client;
      },
      validateCertificate: (cert, host, port) {
        return true;
      },
    ); 
  }
}
