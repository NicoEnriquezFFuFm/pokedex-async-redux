import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_move.dart';
import 'package:pokedexbootcamp/api/model/version_group_detail.dart';

part 'pokemon_moves.freezed.dart';
part 'pokemon_moves.g.dart';

@freezed
class Moves with _$Moves {
  const Moves._();

  const factory Moves({
    @JsonKey(name: "move") Move? move,
    @JsonKey(name: 'version_group_details') VersionGroupDetail? versionGroupDetails,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
