import 'package:dio/dio.dart';
import 'package:pokedexbootcamp/api/api_client.dart';
import 'package:pokedexbootcamp/api/model/pokemon_detail.dart';

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<PokemonDetail> getPokemonDetails({required String id}) async {
    final uri = baseUri.replace(
      path: '${baseUri.path}/pokemon/${id}',
    );

    Response response = await apiClient.dio.getUri(uri);
    PokemonDetail pokeResponse = PokemonDetail.fromJson(response.data);
    return pokeResponse;
  }
}
