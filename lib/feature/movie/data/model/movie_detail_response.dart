import 'package:intv_movie/core/shared-model/genre.dart';
import 'package:intv_movie/core/shared-model/production_company.dart';
import 'package:intv_movie/core/shared-model/production_country.dart';
import 'package:intv_movie/core/shared-model/spoken_languages.dart';

class MovieDetailResponse {
  MovieDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });

  final bool adult;
  final String backdropPath;
  final double budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final double revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) => MovieDetailResponse(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    budget: json["budget"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"],
    posterPath: json["poster_path"],
    productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
    productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
    releaseDate: json["release_date"],
    revenue: json["revenue"].toDouble(),
    runtime: json["runtime"],
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"],
    voteCount: json["vote_count"]
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
    "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
    "release_date": releaseDate,
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount
  }; 
}