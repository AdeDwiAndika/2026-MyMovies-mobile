import '../../domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.posterPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'] ?? 0,
      genres: (json['genres'] as List)
          .map((e) => e['name'].toString())
          .toList(),
    );
  }
}
