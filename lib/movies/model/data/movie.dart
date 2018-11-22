import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  Movie({this.title, this.posterPath});

  String imagePath() {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          posterPath == other.posterPath;

  @override
  int get hashCode => title.hashCode ^ posterPath.hashCode;
}
