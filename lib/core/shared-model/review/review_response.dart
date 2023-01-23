import 'package:intv_movie/core/shared-model/review/review.dart';

class ReviewResponse {
  ReviewResponse({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });

  final int id;
  final int page;
  final List<Review> results;
  final int totalPages;
  final int totalResults;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
    id: json["id"],
    page: json["page"],
    results: List<Review>.from(json["results"].map((x) => Review.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_result": totalResults
  };
}