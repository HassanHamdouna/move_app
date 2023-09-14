import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/network/api_constance.dart';
import 'package:move_app/core/utils/enums.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:move_app/movies/presentation/controllers/movie_details_state.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsMoviesComponent extends StatelessWidget {
  const RecommendationsMoviesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
         buildWhen: (previous, current) =>
         previous.movieRecommendationState != current.movieRecommendationState,
         builder: (context, state) {
           switch (state.movieRecommendationState) {
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
                 delegate: SliverChildBuilderDelegate(
                       (context, index) {
                     final recommendation = state.movieRecommendation[index];
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
                   childCount: state.movieRecommendation.length,
                 ),
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   mainAxisSpacing: 8.0,
                   crossAxisSpacing: 8.0,
                   childAspectRatio: 0.7,
                   crossAxisCount: 3,
                 ),
               );
             case RequestState.error:
              /* return SizedBox(
                 height: 400,
                 child: Center(child: Text(state.movieRecommendationMessage)),
               );*/
               return SliverGrid(
                 delegate: SliverChildBuilderDelegate(
                       (context, index) {
                     return SizedBox(
                       height: 400,
                       child: Center(child: Text(state.movieRecommendationMessage)),
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
