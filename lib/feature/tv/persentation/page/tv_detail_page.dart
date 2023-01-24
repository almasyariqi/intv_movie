import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/core/shared-model/review/review.dart';
import 'package:intv_movie/core/shared-widget/appbar/transparent_appbar.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/shared-widget/card/movie_detail_card.dart';
import 'package:intv_movie/core/shared-widget/card/review_card.dart';
import 'package:intv_movie/core/shared-widget/card/simple_bordered_text_container.dart';
import 'package:intv_movie/core/utils/converters.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_bloc.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_event.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_state.dart';
import 'package:intv_movie/injection_container.dart';

class TvDetailPage extends StatelessWidget {
  final int tvId;

  const TvDetailPage({Key? key, required this.tvId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            sl<TvBloc>()..add(InitTvDetailsState(page: 1, tvId: tvId)),
        child: BlocBuilder<TvBloc, TvState>(builder: (context, state) {
          final List<Review> cuttedReviews =
              state.tvReviews?.results?.take(3).toList() ?? [];

          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: SafeArea(
                      child: Column(
                    children: [
                      Container(
                        width: getScreenWidth(),
                        height: getProportionateScreenHeight(250),
                        child: SimpleMovieCard(
                          imageUri: state.tvDetails?.backdropPath ?? "",
                          borderRadius: 0.0,
                          title: state.tvDetails?.name ?? "",
                          useBackground: true,
                          showSubTitle: false,
                        ),
                      ),
                      MovieDetailCard(
                        posterUri: state.tvDetails?.posterPath ?? "",
                        rating: state.tvDetails?.voteAverage ?? 0.0,
                        voteCount: state.tvDetails?.voteCount ?? 0,
                        overview: state.tvDetails?.overview ?? "",
                        genres: convertGenreToSingleString(
                            state.tvDetails?.genres ?? []),
                      ),
                      SimpleBorderedTextContainer(
                          text:
                              "Total Season: ${state.tvDetails?.numberOfSeasons}"),
                      SimpleBorderedTextContainer(
                          text:
                              "Total Episode: ${state.tvDetails?.numberOfEpisode}"),
                      SimpleBorderedTextContainer(
                        text:
                            "Reviews (${state.tvReviews?.results?.length ?? 0})",
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(15),
                          right: getProportionateScreenWidth(15),
                          top: getProportionateScreenHeight(15),
                        ),
                        color: Colors.grey.withOpacity(0.2),
                        width: getScreenWidth(),
                        child: Column(
                          children: [
                            for (var review in cuttedReviews)
                              Column(
                                children: [
                                  ReviewCard(
                                    authorName:
                                        review.authorDetails?.name ?? "",
                                    authorUsername:
                                        review.authorDetails?.username ?? "",
                                    authorProfilePath:
                                        review.authorDetails?.avatarPath ?? "",
                                    rating: review.authorDetails?.rating ?? 0.0,
                                    content: review.content ?? "",
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  )
                                ],
                              )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(15),
                          right: getProportionateScreenWidth(15),
                          bottom: getProportionateScreenHeight(15),
                        ),
                        color: Colors.grey.withOpacity(0.2),
                        width: getScreenWidth(),
                        child: Text(
                          cuttedReviews.isEmpty
                              ? "No Review Yet"
                              : "See All Reviews",
                          style: TextStyle(
                            color: cuttedReviews.isEmpty
                                ? Colors.grey
                                : Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                PreferredSize(
                  child: const TransparentAppbar(),
                  preferredSize: Size(
                    getScreenWidth(),
                    20.0,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
