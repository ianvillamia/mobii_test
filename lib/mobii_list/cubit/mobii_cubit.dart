import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobii_test/core/providers/providers.dart';
import 'package:mobii_test/mobii_list/domain/models/user_dto.dart';
import 'package:mobii_test/mobii_list/domain/repository/mobii_list_repository.dart';

part 'mobii_state.dart';
part 'mobii_cubit.freezed.dart';

class MobiiCubit extends Cubit<MobiiState> {
  MobiiCubit() : super(const MobiiState.loading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final users = await getIt.get<MobiiListRepository>().getUniqueUsers();
      if (users?.isNotEmpty ?? false) {
        emit(MobiiState.finished(users: users!));
      }
    } catch (e) {
      emit(const MobiiState.error(message: 'Something went wrong'));
    }
  }
}
