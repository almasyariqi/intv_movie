import 'package:intv_movie/core/shared-model/review/author_detail.dart';

class Review {
  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url
  });

  final String? author;
  final AuthorDetail? authorDetails;
  final String? content;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? url;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    author: json["author"],
    authorDetails: AuthorDetail.fromJson(json["author_details"]),
    content: json["content"],
    createdAt: json["created_at"],
    id: json["id"],
    updatedAt: json["updated_at"],
    url: json["url"]
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "author_details": authorDetails?.toJson(),
    "content": content,
    "created_at": createdAt,
    "id": id,
    "updated_at": updatedAt,
    "url": url
  };
}