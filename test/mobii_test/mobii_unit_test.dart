// ignore_for_file: lines_longer_than_80_chars, avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mobii_test/mobii_list/cubit/mobii_cubit.dart';
import 'package:mobii_test/mobii_list/data/mobii_list_service.dart';
import 'package:mobii_test/mobii_list/domain/models/user_dto.dart';
import 'package:mobii_test/mobii_list/domain/repository/mobii_list_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockMobiiListRepository extends Mock implements MobiiListRepository {}

class MobiMobiiCubit extends MockCubit<MobiiState> implements MobiiCubit {}

class MockMobiiApiService extends Mock implements MobiiListApiService {}

void main() {
  final mockRepository = MockMobiiListRepository();
  final mockApiService = MockMobiiApiService();

  const dynamic raw = [
    {'id': '1', 'name': 'John', 'imageUrl': 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'},
    {'id': '1', 'name': 'John', 'imageUrl': 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'},
    {'id': '2', 'name': 'Chris', 'imageUrl': 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'},
    {'id': '3', 'name': 'Mark', 'imageUrl': 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'}
  ];

  const uniqueUsers = [
    UserDto(id: '1', name: 'John', imageUrl: 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'),
    UserDto(id: '2', name: 'Chris', imageUrl: 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'),
    UserDto(id: '3', name: 'Mark', imageUrl: 'https://www.alchinlong.com/wp-content/uploads/2015/09/sample-profile.png'),
  ];

  setUpAll(() async {
    final getIt = GetIt.instance;
    // ignore: cascade_invocations
    getIt.registerLazySingleton<MobiiListRepository>(() => mockRepository);
    when(mockApiService.getAllUsers).thenAnswer((_) async => Future<dynamic>.value(raw));
    when(mockRepository.getUniqueUsers).thenAnswer((_) async {
      return uniqueUsers;
    });
  });

  test('api service should return all users', () async {
    final dynamic res = await mockApiService.getAllUsers();
    expect(res, raw);
  });

  test('get unique users', () async {
    final res = await mockRepository.getUniqueUsers();
    expect(res?.length, 3);
  });

  blocTest<MobiiCubit, MobiiState>(
    'initialize cubit',
    build: MobiiCubit.new,
    seed: MobiiState.loading,
    expect: () => [
      const MobiiState.finished(users: uniqueUsers),
    ],
  );
}
