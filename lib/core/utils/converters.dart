String convertPopularityString(double? popularity) {
  if(popularity == null) return "0";

  if(popularity < 1000) {
    return "$popularity";
  } else {
    final tempPopularity = popularity/1000;
    final roundedPopularity = tempPopularity.toStringAsFixed(2);
    return roundedPopularity+"k";
  }
}