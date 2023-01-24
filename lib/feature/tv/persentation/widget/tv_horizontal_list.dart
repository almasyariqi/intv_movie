import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/utils/converters.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/core/utils/tv_type.dart';
import 'package:intv_movie/feature/tv/data/model/tv.dart';

class TvHorizontalList extends StatelessWidget {
  final List<Tv>? tv;
  final bool isEmpty;
  final bool isLoading;
  final TvType tvType;
  final double cardWidth;
  final double cardHeight;
  final bool useTitleBackground;
  final bool showTitle;
  final bool showSubtitle;
  final double cardBorderRadius;
  final Function? onPressedItem;

  TvHorizontalList({
    Key? key,
    required this.tv,
    required this.isEmpty,
    required this.isLoading,
    required this.tvType,
    this.cardWidth = 100,
    this.cardHeight = 200,
    this.useTitleBackground = false,
    this.showTitle = true,
    this.showSubtitle = true,
    this.cardBorderRadius = 10,
    this.onPressedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(cardHeight),
      child: isLoading
          ? _loading()
          : isEmpty
              ? _emptyList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv?.length,
                  itemBuilder: (builderContext, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(15),
                        ),
                        InkWell(
                          onTap: onPressedItem as void Function()?,
                          child: SimpleMovieCard(
                            imageUri: _tvImageUri(tv, index),
                            width: cardWidth,
                            height: cardHeight,
                            title: tv?[index].name ?? "",
                            showTitle: showTitle,
                            showSubTitle: showSubtitle,
                            subtitle: _tvSubtitle(tv, index),
                            borderRadius: cardBorderRadius,
                            useBackground: useTitleBackground,
                          ),
                        ),
                      ],
                    );
                  }),
    );
  }

  Widget _emptyList() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Center(
        child: Text("Tidak ada data"),
      ),
    );
  }

  Widget _loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  String _tvImageUri(List<Tv>? tv, int index) {
    switch (tvType) {
      case TvType.onTheAir:
        return tv?[index].posterPath ?? "";
      case TvType.popular:
        return tv?[index].backdropPath ?? "";
      default:
        return tv?[index].posterPath ?? "";
    }
  }

  String _tvSubtitle(List<Tv>? tv, int index) {
    switch (tvType) {
      case TvType.onTheAir:
        return "";
      case TvType.popular:
        return "Popularity (${convertPopularityString(tv?[index].popularity)})";
      default:
        return "";
    }
  }
}