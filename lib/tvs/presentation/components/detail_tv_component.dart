// import 'package:animate_do/animate_do.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:move_app/core/network/api_constance.dart';
// import 'package:move_app/core/utils/enums.dart';
// import 'package:move_app/tvs/domain/entities/tv_genres.dart';
// import 'package:move_app/tvs/presentation/components/recommendations_tv_component.dart';
// import 'package:move_app/tvs/presentation/screens/tv_detail_tab_bar_screen.dart';
//
// import '../controllers/tv_details_bloc.dart';
// import '../controllers/tv_details_state.dart';
//
// class DetailTvComponent extends StatelessWidget {
//   const DetailTvComponent({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TvDetailsBloc, TvDetailsState>(
//       buildWhen: (previous, current) => previous.detailState != current.detailState,
//       builder: (context, state) {
//         switch (state.detailState) {
//           case RequestState.loading:
//             return const SizedBox(
//               height: 300,
//               child: Center(child: CircularProgressIndicator()),
//             );
//           case RequestState.loaded:
//             return CustomScrollView(
//               shrinkWrap: true,
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   expandedHeight: 250.0,
//                   leading: IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       )),
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: FadeIn(
//                       duration: const Duration(milliseconds: 500),
//                       child: ShaderMask(
//                         shaderCallback: (rect) {
//                           return const LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [
//                               Colors.transparent,
//                               Colors.black,
//                               Colors.black,
//                               Colors.transparent,
//                             ],
//                             stops: [0.0, 0.5, 1.0, 1.0],
//                           ).createShader(
//                             Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
//                           );
//                         },
//                         blendMode: BlendMode.dstIn,
//                         child: CachedNetworkImage(
//                           width: MediaQuery.of(context).size.width,
//                           imageUrl: ApiConstance.imageUrl(
//                               state.tvDetail!.backdropPath),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: FadeInUp(
//                     from: 20,
//                     duration: const Duration(milliseconds: 500),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(state.tvDetail!.name,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.w700,
//                                 letterSpacing: 1.2,
//                               )),
//                           const SizedBox(height: 8.0),
//                           Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 2.0,
//                                   horizontal: 8.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[800],
//                                   borderRadius: BorderRadius.circular(4.0),
//                                 ),
//                                 child: Text(
//                                   state.tvDetail!.firstAirDate.split('-')[0],
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 16.0),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                     size: 20.0,
//                                   ),
//                                   const SizedBox(width: 4.0),
//                                   Text((state.tvDetail!.voteAverage / 2)
//                                         .toStringAsFixed(1),
//                                     style: const TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.w500,
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 4.0),
//                                   Text(
//                                     '(${state.tvDetail!.numberOfSeasons})',
//                                     style: const TextStyle(
//                                       fontSize: 1.0,
//                                       fontWeight: FontWeight.w500,
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 4.0),
//                                   Text((" ${state.tvDetail!.numberOfSeasons} Seasons"),
//                                     style: const TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.w500,
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 16.0),
//                               Text(/*"${state.tvDetail!.episodeRunTime}"*/
//                                 _showDuration(state.tvDetail!.episodeRunTime),
//                                 style: const TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 16.0,
//                                   fontWeight: FontWeight.w500,
//                                   letterSpacing: 1.2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20.0),
//                           Text(
//                             state.tvDetail!.overview,
//                             style: const TextStyle(
//                               fontSize: 14.0,
//                               fontWeight: FontWeight.w400,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           Text(
//                             'Genres: ${_showGenres(state.tvDetail!.genres)}',
//                             style: const TextStyle(
//                               color: Colors.white70,
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverPadding(
//                   padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
//                   sliver: SliverToBoxAdapter(
//                     child: FadeInUp(
//                       from: 20,
//                       duration: const Duration(milliseconds: 500),
//                       child: Text(
//                         'More like this'.toUpperCase(),
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // const SliverPadding(
//                 //     padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
//                 //     sliver: TvDetailTabBarScreen()),
//               ],
//             );
//           case RequestState.error:
//             return SizedBox(
//               height: 400,
//               child: Center(child: Text(state.detailMessages)),
//             );
//         }
//       },
//     );
//   }
//
//   String _showGenres(List<TvGenres> genres) {
//     String result = '';
//     for (var genre in genres) {
//       result += '${genre.name}, ';
//     }
//
//     if (result.isEmpty) {
//       return result;
//     }
//
//     return result.substring(0, result.length - 2);
//   }
//
//   String _showDuration(int runtime) {
//     final int hours = runtime ~/ 60;
//     final int minutes = runtime % 60;
//
//     if (hours > 0) {
//       return '${hours}h ${minutes}m';
//     } else {
//       return '${minutes}m';
//     }
//   }
// }
