import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_group.freezed.dart';
part 'version_group.g.dart';

@freezed
class VersionGroup with _$VersionGroup {
  const factory VersionGroup({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _VersionGroup;

  factory VersionGroup.fromJson(Map<String, dynamic> json) => _$VersionGroupFromJson(json);
}
