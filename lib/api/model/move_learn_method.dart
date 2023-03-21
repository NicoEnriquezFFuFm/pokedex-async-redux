import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_learn_method.freezed.dart';
part 'move_learn_method.g.dart';

@freezed
class MoveLearnMethod with _$MoveLearnMethod {
  const factory MoveLearnMethod({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _MoveLearnMethod;

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) => _$MoveLearnMethodFromJson(json);
}
