import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/core/utils/tv_type.dart';
import 'package:intv_movie/feature/tv/data/model/tv.dart';

class TvHorizontalList extends StatelessWidget {
  final List<Tv> tv;
  final bool isEmpty;
  final bool isLoading;
  final TvType tvType;
  final double cardWidth;
  final double cardHeight;
  final bool showTitle;
  final bool showSubtitle;
  final Function? onPressedItem;

  TvHorizontalList({
    Key? key,
    required this.tv,
    required this.isEmpty,
    required this.isLoading,
    required this.tvType,
    this.cardWidth = 100,
    this.cardHeight = 200,
    this.showTitle = true,
    this.showSubtitle = true,
    this.onPressedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenHeight(12),
      ),
      child: isLoading
          ? _loading()
          : isEmpty
              ? _emptyList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (builderContext, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: onPressedItem as void Function()?,
                          child: SimpleMovieCard(
                            imageUri: _tvImageUri(tv, index),
                            width: cardWidth,
                            height: cardHeight,
                            title: tv[index].name ?? "",
                            showTitle: showTitle,
                            showSubTitle: showSubtitle,
                            subtitle: _tvSubtitle(tv, index),
                          ),
                        ),
                      ],
                    );
                  }),
    );
  }

  Widget _emptyList() {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(500),
      width: double.infinity,
      child: const Center(
        child: Text("Tidak ada data"),
      ),
    );
  }

  Widget _loading() {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(500),
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  String _tvImageUri(List<Tv> tv, int index) {
    switch (tvType) {
      case TvType.onTheAir:
        return tv[index].backdropPath ?? "";
      case TvType.popular:
        return tv[index].posterPath ?? "";
      default:
        return tv[index].posterPath ?? "";
    }
  }

  String _tvSubtitle(List<Tv> tv, int index) {
    switch (tvType) {
      case TvType.onTheAir:
        return "";
      case TvType.popular:
        return "Popularity (${tv[index].popularity})";
      default:
        return "";
    }
  }
}