class DioRequestManager {
  DioRequestManager() {
    BaseOptions options = BaseOptions(
      connectTimeout: _connectionTimeout,
      receiveTimeout: _receiveTimeout,
    );
    _dio = Dio(options);
    //check bad certificate
    // (_dio.httpClientAdapter as IOHttpClientAdapter). =
    //     (HttpClient dioClient) {
    //   dioClient.badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);
    //   return dioClient;
    // };
    setInterceptor();
  }

  final _connectionTimeout = const Duration(seconds: 50);
  final _receiveTimeout = const Duration(seconds: 50);
  late Dio _dio;
  String? token;

  void setInterceptor() async {
    _dio.interceptors.add(InterceptorsWrapper(
      //     onRequest: (r, handler) async {
      //   print('${r}1111111111111111111111111111111');
      //   handler.next(r);
      // }, onResponse: (res, handler) async {
      //   print('${res}22222222222222222222');
      //   handler.next(res);
      // },
        onError: (e, handler) async {
          ErrorInterceptor(dio: _dio).onError(e, handler);
          handler.next(e);
        }));
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    await setHeader();
  }

  Future<void> setHeader({String? token}) async {
    String? accessToken;
    if (token == null) {
      var res = await getIt<FlutterSecureStorage>().read(key: Config.tokenKey);
      if (res != null && res.runtimeType == Map) {
        accessToken = jsonDecode(res)[Config.tokenKey];
      } else {
        accessToken = res;
      }
    } else {
      accessToken = token;
    }
    await getIt<FlutterSecureStorage>()
        .write(key: Config.tokenKey, value: accessToken);

    if (accessToken != null) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    _dio.options.headers.addAll({
      'Accept': 'application/json, text/plain',
      'Content-Type': 'application/json;charset=UTF-8',
    });
  }

  Future<Response> apiCall(
      {required String url,
        required String requestType,
        Object? data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? header}) async {
    try {
      var res = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: requestType,
          headers: header,
        ),
      );
      return res;
    } on SocketException {
      throw Failure(
          message: 'noInternetConnection'.tr(),
          type: ErrorType.socketException);
    } on FormatException catch (e) {
      debugPrint('*** handlerRepository: $e' '\n' 'stackTrace: $e ');
      debugPrint(' *** ' + e.toString());
      throw Failure(message: e.message, type: ErrorType.formatException);
    } on DioException catch (e) {
      debugPrint('*** handlerRepository: $e' '\n' 'stackTrace: $e ');
      debugPrint(' *** ' + e.toString());
      if (e.response != null) {
        //only 401 && 403 data response error is empty;(Agree with backend)
        if (e.response?.statusCode != 401 && e.response?.statusCode != 403) {
          var res = ApiResponse.fromJson(e.response?.data);
          throw Failure.networkException(
              message: res.responseException?.exceptionMessage?.description ??
                  'api Error',
              type: ErrorType.networkException,
              networkException: res);
        } else {
          throw Failure.networkException(
              message: e.message ?? '401 || 403 response',
              type: ErrorType.networkException,
              networkException: ApiResponse(
                  isError: true, statusCode: e.response!.statusCode));
        }
      } else {
        throw Failure(
            message: 'connectionTimeout',
            type: ErrorType.networkException,
            dioException: e);
      }
    } on Failure {
      rethrow;
    }
  }
}
