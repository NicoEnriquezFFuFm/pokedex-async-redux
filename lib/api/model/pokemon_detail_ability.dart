import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_ability.freezed.dart';
part 'pokemon_detail_ability.g.dart';

@freezed
class Ability with _$Ability {
  factory Ability({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
