class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.languageCode,
    required this.name
  });

  final String? englishName;
  final String? languageCode;
  final String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    languageCode: json["iso_639_1"],
    name: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": languageCode,
    "name": name
  };
}