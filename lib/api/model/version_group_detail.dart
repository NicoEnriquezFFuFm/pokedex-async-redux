import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/move_learn_method.dart';
import 'package:pokedexbootcamp/api/model/version_group.dart';

part 'version_group_detail.freezed.dart';
part 'version_group_detail.g.dart';

@freezed
class VersionGroupDetail with _$VersionGroupDetail {
  const VersionGroupDetail._();

  const factory VersionGroupDetail({
    @JsonKey(name: 'level_learned_at') int? levelLearnedAt,
    @JsonKey(name: 'move_learn_method') MoveLearnMethod? moveLearnMethod,
    @JsonKey(name: 'version_group') VersionGroup? versionGroup,
  }) = _VersionGroupDetail;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);
}
