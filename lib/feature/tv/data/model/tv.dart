class Tv {
  Tv({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountries,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount
  });

  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountries;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  factory Tv.fromJson(Map<String, dynamic> json) => Tv(
    backdropPath: json["backdrop_path"],
    firstAirDate: json["first_air_date"],
    genreIds: json["genre_ids"] != null ? List<int>.from(json["genre_ids"].map((x) => x)) : [],
    id: json["id"],
    name: json["name"],
    originCountries: json["origin_country"] != null ? List<String>.from(json["origin_country"].map((x) => x)) : [],
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
     "backdrop_path": backdropPath,
      "first_air_date": firstAirDate,
      "genre_ids": genreIds != null ? List<dynamic>.from(genreIds!.map((x) => x)) : [],
      "id": id,
      "name": name,
      "origin_country": originCountries != null ? List<dynamic>.from(originCountries!.map((x) => x)) : [],
      "original_language": originalLanguage,
      "original_name": originalName,
      "overview": overview,
      "popularity": popularity,
      "poster_path": posterPath,
      "vote_average": voteAverage,
      "vote_count": voteCount
  };
}