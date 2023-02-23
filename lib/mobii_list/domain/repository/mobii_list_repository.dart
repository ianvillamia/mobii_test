// ignore_for_file: one_member_abstracts

import 'package:mobii_test/mobii_list/domain/models/user_dto.dart';

abstract class MobiiListRepository {
  Future<List<UserDto>>? getUniqueUsers();
}
