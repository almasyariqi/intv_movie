class ProductionCountry {
  ProductionCountry({
    required this.countryCode,
    required this.name
  });

  final String? countryCode;
  final String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    countryCode: json["iso_3166_1"],
    name: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": countryCode,
    "name": name
  };
}