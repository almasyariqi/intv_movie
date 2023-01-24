import 'package:intv_movie/core/usecase/usecase.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository.dart';

class GetOnTheAirTvUseCase implements UseCase<TvResponse, int> {
  final TvRepository _repository;

  GetOnTheAirTvUseCase(this._repository);

  @override
  Future<TvResponse> call(int page) async {
    return await _repository.getOnTheAirTv(page);
  }

}