import 'package:intv_movie/core/usecase/usecase.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository.dart';

class GetPopularTvUseCase implements UseCase<TvResponse, int> {
  final TvRepository _repository;

  GetPopularTvUseCase(this._repository);

  @override
  Future<TvResponse> call(int page) async {
    return _repository.getPopularTv(page);
  }

}