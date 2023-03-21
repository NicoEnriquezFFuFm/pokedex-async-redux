import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail_ability.dart';

part 'pokemon_detail_abilities.freezed.dart';
part 'pokemon_detail_abilities.g.dart';

@freezed
class Abilities with _$Abilities {
  factory Abilities({
    @JsonKey(name: "is_hidden") bool? isHidden,
    @JsonKey(name: "slot") int? slot,
    required Ability ability,
  }) = _Abilities;

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}
