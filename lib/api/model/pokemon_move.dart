import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move.freezed.dart';
part 'pokemon_move.g.dart';

@freezed
class Move with _$Move {
  const factory Move({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "url") String? url,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
