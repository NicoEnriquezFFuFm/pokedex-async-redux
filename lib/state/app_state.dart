import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
    @Default(<Pokemon>[]) List<Pokemon> pokemonSearch,
    @Default(null) PokemonDetail? pokeDetail,
    @Default(Wait.empty) @JsonKey(ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
