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

  Future<PokemonDetail> getPokemonDetails({required String id}) async {
    final uri = baseUrl.replace(
      path: '${baseUrl.path}/pokemon/${id}',
    );

    Response response = await apiClient.dio.getUri(uri);
    PokemonDetail pokeResponse = PokemonDetail.fromJson(response.data);
    return pokeResponse;
  }
}
