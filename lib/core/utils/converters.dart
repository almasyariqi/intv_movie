import 'package:intv_movie/core/shared-model/genre.dart';
import 'package:intv_movie/core/shared-model/production_company.dart';

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

String convertGenreToSingleString(List<Genre> genres) {
  final sb = StringBuffer();

  var stringList = [];
  for(var genre in genres) {
    stringList.add(genre.name);
  }
  
  sb.writeAll(stringList, ", ");

  return sb.toString();
}

String convertProductionCompanyToSingleString(List<ProductionCompany> prodCompanies) {
  final sb = StringBuffer();

  var stringList = [];
  for(var prodCompany in prodCompanies) {
    stringList.add(prodCompany.name);
  }
  
  sb.writeAll(stringList, ", ");

  return sb.toString();
 
}