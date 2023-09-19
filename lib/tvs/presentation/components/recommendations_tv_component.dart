import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_state.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_state.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/tv_details_bloc.dart';

class RecommendationsTVComponent extends StatelessWidget {
  const RecommendationsTVComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
         buildWhen: (previous, current) =>
         previous.recommendationState != current.recommendationState,
         builder: (context, state) {
           switch (state.recommendationState) {
             case RequestState.loading:
               return SliverGrid(
                 delegate: SliverChildBuilderDelegate(
                       (context, index) {
                         return const SizedBox(
                           height: 400,
                           child: Center(child: CircularProgressIndicator()),
                         );
                   },
                 ),
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   mainAxisSpacing: 8.0,
                   crossAxisSpacing: 8.0,
                   childAspectRatio: 0.7,
                   crossAxisCount: 3,
                 ),
               );
               case RequestState.loaded:
               return SliverGrid(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   mainAxisSpacing: 8.0,
                   crossAxisSpacing: 8.0,
                   childAspectRatio: 0.7,
                   crossAxisCount: 3,
                 ),
                 delegate: SliverChildBuilderDelegate((context, index) {
                     final recommendation = state.tvRecommendation[index];
                     return FadeInUp(
                       from: 20,
                       duration: const Duration(milliseconds: 500),
                       child: ClipRRect(
                         borderRadius:
                         const BorderRadius.all(Radius.circular(4.0)),
                         child: CachedNetworkImage(
                           imageUrl:
                           ApiConstance.imageUrl(recommendation.backdropPath!),
                           placeholder: (context, url) => Shimmer.fromColors(
                             baseColor: Colors.grey[850]!,
                             highlightColor: Colors.grey[800]!,
                             child: Container(
                               height: 170.0,
                               width: 120.0,
                               decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                             ),
                           ),
                           errorWidget: (context, url, error) =>
                           const Icon(Icons.error),
                           height: 180.0,
                           fit: BoxFit.cover,
                         ),
                       ),
                     );
                   },
                   childCount: state.tvRecommendation.length,
                 ),
               );
             case RequestState.error:
               return SliverGrid(
                 delegate: SliverChildBuilderDelegate(
                       (context, index) {
                     return SizedBox(
                       height: 400,
                       child: Center(child: Text(state.recommendationMessages)),
                     );
                   },
                 ),
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   mainAxisSpacing: 8.0,
                   crossAxisSpacing: 8.0,
                   childAspectRatio: 0.7,
                   crossAxisCount: 3,
                 ),
               );
           }
         },
       );
  }
}
