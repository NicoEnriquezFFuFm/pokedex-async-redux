import 'dart:core';

import 'package:pokedexbootcamp/api/api_client.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail_abilities.dart';
import 'package:pokedexbootcamp/api/model/pokemon_moves.dart';
import 'package:pokedexbootcamp/api/model/pokemon_stats.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUrl,
  });

  final ApiClient apiClient;
  final Uri baseUrl;

  // TODO: to be continued

  Future<List<Pokemon>> getPokemonList({required String offset, required String limit}) async {
    final queryParam = <String, dynamic>{};

    queryParam['limit'] = limit;
    queryParam['offset'] = offset;

    final uri = baseUrl.replace(
      queryParameters: queryParam,
      path: '${baseUrl.path}/pokemon',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['results'].map<Pokemon>((dynamic data) => Pokemon.fromJson(data as Json)).toList();
    });
  }

  Future<List<Abilities>> getPokemonDetailsAbilities(
      {required String offset, required String limit, required String id}) async {
    final queryParam = <String, dynamic>{};

    queryParam['limit'] = limit;
    queryParam['offset'] = offset;

    final uri = baseUrl.replace(
      queryParameters: queryParam,
      path: '${baseUrl.path}/pokemon/${id}',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['abilities'].map<Abilities>((dynamic data) => Abilities.fromJson(data as Json)).toList();
    });
  }

  Future<List<Moves>> getPokemonDetailsMoves(
      {required String offset, required String limit, required String id}) async {
    final queryParam = <String, dynamic>{};

    queryParam['limit'] = limit;
    queryParam['offset'] = offset;

    final uri = baseUrl.replace(
      queryParameters: queryParam,
      path: '${baseUrl.path}/pokemon/${id}',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['move'].map<Moves>((dynamic data) => Moves.fromJson(data as Json)).toList();
    });
  }

  Future<List<Stats>> getPokemonDetailsStats(
      {required String offset, required String limit, required String id}) async {
    final queryParam = <String, dynamic>{};

    queryParam['limit'] = limit;
    queryParam['offset'] = offset;

    final uri = baseUrl.replace(
      queryParameters: queryParam,
      path: '${baseUrl.path}/pokemon/${id}',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['stats'].map<Moves>((dynamic data) => Stats.fromJson(data as Json)).toList();
    });
  }

  Future<List<PokemonDetail>> getPokemonDetailsAbilitiesWidth(
      {required String offset, required String limit, required String id}) async {
    final queryParam = <String, dynamic>{};

    queryParam['limit'] = limit;
    queryParam['offset'] = offset;

    //https://pokeapi.co/api/v2/pokemon?limit=151&offset=0
    https: //pokeapi.co/api/v2/pokemon/1/
    final uri = baseUrl.replace(
      queryParameters: queryParam,
      path: '${baseUrl.path}/pokemon/${id}',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data["abilities"].map<PokemonDetail>((dynamic data) => PokemonDetail.fromJson(data as Json));
    });
  }
}
