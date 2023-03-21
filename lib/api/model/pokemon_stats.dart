import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedexbootcamp/api/model/pokemon_stat.dart';

part 'pokemon_stats.freezed.dart';
part 'pokemon_stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    @JsonKey(name: "base_stat") int? baseStat,
    @JsonKey(name: "effort") int? effort,
    @JsonKey(name: "stat") Stat? stat,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
