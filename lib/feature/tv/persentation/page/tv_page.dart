import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/core/network/api_response_state.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/core/utils/tv_type.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_bloc.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_event.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_state.dart';
import 'package:intv_movie/feature/tv/persentation/page/tv_detail_page.dart';
import 'package:intv_movie/feature/tv/persentation/widget/tv_horizontal_list.dart';
import 'package:intv_movie/injection_container.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TV Shows"),
      ),
      body: BlocProvider(
        create: (_) => sl<TvBloc>()..add(GetAllTvs(page: 1)),
        child: BlocBuilder<TvBloc, TvState>(builder: (context, state) {
          return Container(
            child: RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    _titleText("On The Air"),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    TvHorizontalList(
                        tv: state.onTheAirTv?.results,
                        isEmpty: state.onTheAirTv?.results?.isEmpty ?? true,
                        isLoading: state.responseState is ResLoading,
                        tvType: TvType.onTheAir,
                        cardWidth: 200,
                        cardHeight: 300,
                        showTitle: false,
                        showSubtitle: false,
                        onPressedItem: (tvId) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TvDetailPage(tvId: tvId)));
                        }),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _titleText("Popular TV Shows"),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    TvHorizontalList(
                      tv: state.popularTv?.results,
                      isEmpty: state.onTheAirTv?.results?.isEmpty ?? true,
                      isLoading: state.responseState is ResLoading,
                      tvType: TvType.popular,
                      cardWidth: 300,
                      useTitleBackground: true,
                      onPressedItem: (tvId) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TvDetailPage(tvId: tvId)));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _titleText(String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    context.read<TvBloc>().add(GetAllTvs(page: 1));
  }
}
