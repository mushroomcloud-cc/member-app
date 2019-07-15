import 'package:dio/dio.dart';
import 'package:member_app/constants/app_config.dart' as config;
import 'package:member_app/models/user.dart';

var options = BaseOptions(baseUrl: config.apiServer);
Dio dio = new Dio(options);


/// service call server apis
class ApiService {
  static final ApiService _service = new ApiService._internal();
  
  static final String userApi = 'api/rbac/user';

  factory ApiService() {
    assert(config.apiServer.isNotEmpty,'apiServer must not be empty');
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return _service;
  }
  ApiService._internal();

  /// User login
  Future<User> login(User user) async {
    print('user: ${user.username}  ${user.password}');
    Response response = await dio.post('$userApi/login',data: {
      'username': user.username,
      'password': user.password
    });
    var data = response.data;
    print('reponse:${response.data}');
    if(data['success']) {
      return Future.value(User.fromJson(data['value']));
    } else {
      return Future.error(data['message']??'内部错误');
    }
  }
}
