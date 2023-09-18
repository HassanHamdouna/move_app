import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/tvs/presentation/components/item_popular_tv_details_component.dart';
import 'package:move_app/tvs/presentation/components/item_top_tv_details_component.dart';
import 'package:move_app/tvs/presentation/controllers/tv_bloc.dart';
import 'package:move_app/tvs/presentation/controllers/tv_event.dart';

import '../../../core/services/services_locator.dart';

class TVListPopularAndTopRatedScreen extends StatelessWidget {
  final String nameScreen;

  const TVListPopularAndTopRatedScreen({super.key, required this.nameScreen });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()..add(GetTvPopularEvent())..add(GetTvTopRatedEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
          backgroundColor: Colors.black26,
          title: isPopularScreen
              ? const Text("popular TV")
              : const Text("Top Rated Tv"),
        ),
        body: isPopularScreen
            ? const ItemPopularTVDetailsComponent()
            : const ItemTopTvDetailsComponent(),

      ),
    );
  }

  get isPopularScreen => nameScreen == "popular";
}
