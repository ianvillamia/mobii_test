import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'mobii_list_service.g.dart';

@RestApi(baseUrl: 'https://gist.githubusercontent.com/dustincatap/66d48847b3ca07af7cef789d6ac8fee8/raw/550798be0efa8b98f6924cfb4ad812cd290f568a/')
abstract class MobiiListApiService {
  factory MobiiListApiService(
    Dio dio, {
    String baseUrl,
  }) = _MobiiListApiService;

  /// gets all users/
  @GET('users.json')
  Future<dynamic> getAllUsers();
}
