class AuthorDetail {
  AuthorDetail({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating
  });

  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  factory AuthorDetail.fromJson(Map<String, dynamic> json) => AuthorDetail(
    name: json["name"],
    username: json["username"],
    avatarPath: json["avatar_path"],
    rating: json["rating"]?.toDouble()
  );
  
  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "avatar_path": avatarPath,
    "rating": rating
  };
}