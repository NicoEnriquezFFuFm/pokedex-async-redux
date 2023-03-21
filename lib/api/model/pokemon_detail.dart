import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail_abilities.dart';
import 'package:pokedexbootcamp/api/model/pokemon_moves.dart';
import 'package:pokedexbootcamp/api/model/pokemon_stats.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  factory PokemonDetail({
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "weight") int? weight,
    @JsonKey(name: "base_experience") int? baseExperience,
    @JsonKey(name: "abilities") Abilities? abilities,
    @JsonKey(name: "moves") Moves? moves,
    @JsonKey(name: "stats") Stats? stats,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => _$PokemonDetailFromJson(json);
}
