part of 'mobii_cubit.dart';

@freezed
class MobiiState with _$MobiiState {
  const factory MobiiState.loading() = _Loading;
  const factory MobiiState.finished({required List<UserDto> users}) = _Finished;
  const factory MobiiState.error({required String message}) = _Error;
}
