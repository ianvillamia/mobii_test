import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobii_test/core/providers/providers.dart';
import 'package:mobii_test/mobii_list/data/mobii_list_service.dart';
import 'package:mobii_test/mobii_list/domain/models/user_dto.dart';
import 'package:mobii_test/mobii_list/domain/repository/mobii_list_repository.dart';

class MobiiListRepositoryImpl implements MobiiListRepository {
  const MobiiListRepositoryImpl();

  @override
  Future<List<UserDto>>? getUniqueUsers() async {
    try {
      final mobiiApiService = getIt<MobiiListApiService>();

      final raw = await mobiiApiService.getAllUsers() as String;
      final dynamic decoded = jsonDecode(raw);
      final allUsers = decoded as List;

      // ignore: lines_longer_than_80_chars
      final mappedUsers = allUsers.map((dynamic item) => UserDto.fromJson(item as Map<String, dynamic>)).toList();

      final set = Set<UserDto>.from(mappedUsers);
      return set.toList();
    } on DioError catch (_) {
      rethrow;
    }
  }
}
