import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail_abilities.dart';
import 'package:pokedexbootcamp/api/model/pokemon_moves.dart';
import 'package:pokedexbootcamp/api/model/pokemon_stats.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';


@freezed
class PokemonDetail with _$PokemonDetail {
  factory PokemonDetail({
    @JsonKey(name: "height") required int height,
    @JsonKey(name: "weight") required int weight,
    @JsonKey(name: "base_experience") required int baseExperience,
    @JsonKey(name: "abilities") List<Abilities>? abilities,
    @JsonKey(name: "moves") List<Moves>? moves,
    @JsonKey(name: "stats") List<Stats>? stats,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => _$PokemonDetailFromJson(json);
}
