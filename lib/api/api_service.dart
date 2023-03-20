import 'package:pokedexbootcamp/api/api_client.dart';
import 'package:pokedexbootcamp/api/handler/pokemon_api.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  late final Uri _baseUrl = Uri.parse(ApiClient.baseUrl);

  PokemonApi? _pokemonApi;

  PokemonApi get pokemonApi => _pokemonApi ??= PokemonApi(apiClient: _apiClient, baseUrl: _baseUrl);
}
