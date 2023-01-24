import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/core/network/api_response_state.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_on_the_air_tv_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_popular_tv_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_tv_details_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_tv_reviews_usecase.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_event.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvUseCase getOnTheAirTvUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvReviewsUseCase getTvReviewsUseCase;

  TvBloc(
    this.getOnTheAirTvUseCase,
    this.getPopularTvUseCase,
    this.getTvDetailsUseCase,
    this.getTvReviewsUseCase
  ) : super(TvState()) {
    on<GetAllTvs>(_getAllTvs);
    on<GetOnTheAirTv>(_getOnTheAirTv);
    on<GetPopularTv>(_getPopularTv);
    on<GetTvDetails>(_getTvDetails);
    on<GetTvReviews>(_getTvReviews);
    on<InitTvDetailsState>(_initTvDetailsSstate);
  }

  void _getAllTvs(GetAllTvs event, Emitter<TvState> emit) async {

    add(GetOnTheAirTv(page: event.page));
    add(GetPopularTv(page: event.page));

  }

  void _getOnTheAirTv(GetOnTheAirTv event, Emitter<TvState> emit) async {
    emit(state.copyWith(responseState: ResLoading()));
    try {
      final onTheAirTv = await getOnTheAirTvUseCase(event.page);
      emit(state.copyWith(onTheAirTv: onTheAirTv, responseState: ResSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(responseState: ResFailed()));
    }
  }

  void _getPopularTv(GetPopularTv event, Emitter<TvState> emit) async {
    emit(state.copyWith(responseState: ResLoading()));
    try {
      final popularTv = await getPopularTvUseCase(event.page);
      emit(state.copyWith(popularTv: popularTv, responseState: ResSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(responseState: ResFailed()));
    }
  }

  void _getTvDetails(GetTvDetails event, Emitter<TvState> emit) async {
    emit(state.copyWith(responseState: ResLoading()));
    try {
      final tvDetails = await getTvDetailsUseCase(event.tvId);
      emit(state.copyWith(tvDetails: tvDetails, responseState: ResSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(responseState: ResFailed()));
    }
  }

  void _getTvReviews(GetTvReviews event, Emitter<TvState> emit) async {
    emit(state.copyWith(responseState: ResLoading()));
    try {
      final tvReviews = await getTvReviewsUseCase(TvReviewsParams(page: event.page, tvId: event.tvId));
      emit(state.copyWith(tvReviews: tvReviews, responseState: ResSuccess()));
    } on Exception catch (e) {
      emit(state.copyWith(responseState: ResFailed()));
    }
  }

  void _initTvDetailsSstate(InitTvDetailsState event, Emitter<TvState> emit) async {
      add(GetTvDetails(tvId: event.tvId));
      add(GetTvReviews(page: event.page, tvId: event.tvId));
  }
}