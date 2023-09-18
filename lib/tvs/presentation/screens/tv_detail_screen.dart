import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/tvs/presentation/components/detail_tv_component.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_bloc.dart';
import 'package:move_app/tvs/presentation/controllers/tv_details_event.dart';

import '../../../core/services/services_locator.dart';

class TvDetailScreen extends StatelessWidget {
  final int id;

  const TvDetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvDetailsBloc>()..add(GetTvDetailsEvent(id))..add(GetTvRecommendationEvent(id)),
      child:  const Scaffold(
        body:  DetailTvComponent(),
      ),
    );
  }
}
