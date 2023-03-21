import 'dart:core';

import 'package:dio/dio.dart';
import 'package:pokedexbootcamp/api/api_client.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUrl,
  });

  final ApiClient apiClient;
  final Uri baseUrl;

  Future<PokemonDetail> getPokemonDetails({required String name}) async {
    final uri = baseUrl.replace(
      path: '${baseUrl.path}/pokemon/$name',
    );

    Response response = await apiClient.dio.getUri(uri);
    return PokemonDetail.fromJson(response.data);
  }
}
