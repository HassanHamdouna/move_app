import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/core/global/localization/app_strings.dart';
import 'package:move_app/tvs/presentation/components/on_the_air_componet.dart';
import 'package:move_app/tvs/presentation/components/popular_tv_component.dart';
import 'package:move_app/tvs/presentation/components/top_rated_tv_component.dart';
import 'package:move_app/tvs/presentation/controllers/tv_bloc.dart';
import 'package:move_app/tvs/presentation/controllers/tv_event.dart';

import '../../../core/services/services_locator.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()..add(GetTVOnTheAirEvent())..add(GetTVPopularEvent())..add(GetTVTopRatedEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnTheAirComponent(),
              popular(context),
              const PopularTvComponent(),
              topRated(context),
              const TopRatedTvComponent(),
              const SizedBox(height: 50.0),

            ],
          ),
        ),

      ),
    );
  }

  Widget popular(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.popular,
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MovieListPopularAndTopRatedScreen(nameScreen: "popular"),));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppStrings.seeMore,
                      style: GoogleFonts.poppins(color: Colors.white)),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16.0, color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topRated(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.topRated,
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MovieListPopularAndTopRatedScreen(nameScreen: "top Rated"),));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppStrings.seeMore,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      )),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16.0, color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
