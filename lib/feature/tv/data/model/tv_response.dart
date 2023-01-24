import 'package:intv_movie/feature/tv/data/model/tv.dart';

class TvResponse {
  TvResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<Tv>? results;
  final int? totalPages;
  final int? totalResults;

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
    page: json["page"],
    results: json["results"] != null ? List<Tv>.from(json["results"].map((x) => Tv.fromJson(x))) : [],
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": results != null ? List<dynamic>.from(results!.map((x) => x.toJson())) : [],
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}