import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends Equatable {
  const UserDto({
    this.id,
    this.imageUrl,
    this.name,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  List<Object?> get props => <Object?>[id, name, imageUrl];

  @override
  // ignore: lines_longer_than_80_chars
  bool operator ==(Object other) => identical(this, other) || other is UserDto && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
}
