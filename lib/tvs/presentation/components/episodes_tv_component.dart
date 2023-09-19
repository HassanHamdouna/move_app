import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/utils/dummy.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_bloc.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_bloc.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/enums.dart';

class EpisodesTvComponent extends StatefulWidget {
  const EpisodesTvComponent({
    super.key,
  });

  @override
  State<EpisodesTvComponent> createState() => _EpisodesTvComponentState();
}

class _EpisodesTvComponentState extends State<EpisodesTvComponent> {
  int? _selectCountryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous.detailState != current.detailState,
      builder: (context, state) {
        switch (state.detailState) {
          case RequestState.loading:
            return ListView();
          case RequestState.loaded:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<int>(
                    elevation: 4,
                    items: state.tvDetail!.seasons.map(
                      (e) {
                        return DropdownMenuItem<int>(
                            value: e.id,
                            child: Text(
                              e.name,
                              style: GoogleFonts.montaga(
                                color: Colors.white,
                              ),
                            ));
                      },
                    ).toList(),
                    isExpanded: true,
                    isDense: false,
                    alignment: AlignmentDirectional.center,
                    hint: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('Season 1',
                          style: GoogleFonts.montaga(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 18)),
                    ),
                    value: _selectCountryId,
                    // underline: const Divider(),
                    borderRadius: BorderRadius.circular(5),
                    itemHeight: 50,
                    dropdownColor: Colors.black54,
                    icon: const Icon(Icons.keyboard_arrow_down_sharp,
                        size: 30, color: Colors.white),
                    onChanged: (int? value) {
                      setState(() {
                        _selectCountryId = value;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      /// 1 ///

                      // return _country.map(
                      //       (e) {
                      //     return DropdownMenuItem<int>(
                      //         value: e.id,
                      //         child: Text(
                      //           e.title,
                      //           style: GoogleFonts.montaga(
                      //             color: Colors.white,
                      //           ),
                      //         ));
                      //   },
                      // ).toList();
                      /// 2 ///
                      return _selectCountryId != null
                          ? state.tvDetail!.seasons
                              .map(
                                (e) => Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    state.tvDetail!.seasons
                                        .firstWhere((element) =>
                                            element.id == _selectCountryId)
                                        .name,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [];
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: state.tvDetail!.seasons.length,
                    itemBuilder: (context, index) {
                      final tv = state.tvDetail!.seasons[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstance.imageUrl(
                                      tv.posterPath ??
                                          "/yii7eIlaw1MRMfa7FTA6mW8hBUQ.jpg"),
                                  height: 140.0,
                                  width: 90,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 140.0,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tv.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          convertDateFormat(tv.airDate!),
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(tv.overview,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          case RequestState.error:
            return ListView();
        }
      },
    );
  }

  String convertDateFormat(String inputDateString) {
    try {
      var inputFormat = DateFormat('y-MM-dd');
      var outputFormat = DateFormat('MMMM d, y', 'en_US');
      var dateTime = inputFormat.parse(inputDateString);
      return outputFormat.format(dateTime);
    } catch (e) {
      // Handle any parsing/formatting errors here
      print('Error: $e');
      return ''; // Return null or an error message as needed
    }
  }
}
