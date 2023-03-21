import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_stat.freezed.dart';
part 'pokemon_stat.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "hp") String? url,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
