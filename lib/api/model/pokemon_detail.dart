import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail_abilities.dart';
import 'package:pokedexbootcamp/api/model/pokemon_moves.dart';
import 'package:pokedexbootcamp/api/model/pokemon_sprites.dart';
import 'package:pokedexbootcamp/api/model/pokemon_stats.dart';
import 'package:pokedexbootcamp/api/model/pokemon_types.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  factory PokemonDetail({
    @JsonKey(name: "height") required int height,
    @JsonKey(name: "weight") required int weight,
    @JsonKey(name: "base_experience") required int baseExperience,
    @JsonKey(name: "abilities") required List<Abilities> abilities,
    @JsonKey(name: "moves") required List<Moves> moves,
    @JsonKey(name: "stats") required List<Stats> stats,
    @JsonKey(name: "types") required List<PokemonTypes> types,
    @JsonKey(name: "sprites") required PokemonSprites sprite,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => _$PokemonDetailFromJson(json);
}
