import 'package:intv_movie/core/shared-model/genre.dart';
import 'package:intv_movie/core/shared-model/production_company.dart';
import 'package:intv_movie/core/shared-model/production_country.dart';
import 'package:intv_movie/core/shared-model/spoken_languages.dart';
import 'package:intv_movie/feature/tv/data/model/tv_episode.dart';
import 'package:intv_movie/feature/tv/data/model/tv_season.dart';

class TvDetailResponse {
  TvDetailResponse({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.numberOfEpisode,
    required this.numberOfSeasons,
    required this.originCountries,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount
  });

  final bool adult;
  final String backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final String lastAirDate;
  final Episode lastEpisodeToAir;
  final String name;
  final Episode nextEpisodeToAir;
  final int numberOfEpisode;
  final int numberOfSeasons;
  final List<String> originCountries;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<TvSeason> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) => TvDetailResponse(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
    episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
    firstAirDate: json["first_air_date"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    inProduction: json["in_production"],
    lastAirDate: json["last_air_date"],
    lastEpisodeToAir: Episode.fromJson(json["last_episode_to_air"]),
    name: json["name"],
    nextEpisodeToAir: Episode.fromJson(json["next_episode_to_air"]),
    numberOfEpisode: json["number_of_episodes"],
    numberOfSeasons: json["number_of_seasons"],
    originCountries: List<String>.from(json["origin_country"].map((x) => x)),
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
    productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
    seasons: List<TvSeason>.from(json["seasons"].map((x) => TvSeason.fromJson(x))),
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    type: json["type"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"]
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
    "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
    "first_air_date": firstAirDate,
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "in_production": inProduction,
    "last_air_date": lastAirDate,
    "last_episode_to_air": lastEpisodeToAir.toJson(),
    "name": name,
    "next_episode_to_air": nextEpisodeToAir.toJson(),
    "number_of_episodes": numberOfEpisode,
    "number_of_seasons": numberOfSeasons,
    "origin_country": List<String>.from(originCountries.map((x) => x)),
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
    "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
    "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
    "status": status,
    "tagline": tagline,
    "type": type,
    "vote_average": voteAverage,
    "vote_count": voteCount
  }; 
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.profilePath
  });

  final int id;
  final String creditId;
  final String name;
  final String profilePath;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    creditId: json["credit_id"],
    name: json["name"],
    profilePath: json["profile_path"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "creditId": creditId,
    "name": name,
    "profile_path": profilePath
  };
}