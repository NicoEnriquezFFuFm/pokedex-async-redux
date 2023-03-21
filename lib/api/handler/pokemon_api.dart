import 'package:pokedexbootcamp/api/api_client.dart';
import 'package:pokedexbootcamp/api/model/pokemon.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUrl,
  });

  final ApiClient apiClient;
  final Uri baseUrl;

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
}
