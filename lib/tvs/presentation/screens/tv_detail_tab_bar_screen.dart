import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/tvs/presentation/components/recommendations_tv_component.dart';

import '../components/episodes_tv_component.dart';

class TvDetailTabBarScreen extends StatefulWidget {
  const TvDetailTabBarScreen({Key? key}) : super(key: key);

  @override
  State<TvDetailTabBarScreen> createState() => _TvDetailTabBarScreenState();
}

class _TvDetailTabBarScreenState extends State<TvDetailTabBarScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 1,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 3,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.red, width: 4.0),
                insets: EdgeInsets.fromLTRB(00, 0.0, 00.0, 40.0),
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              isScrollable: false,
              onTap: (int tabIndex) {
                setState(() {
                  _tabController.index = tabIndex;
                });
              },
              tabs: [
                Tab(
                  child: Text('EPISODES',
                      style: GoogleFonts.poppins(
                          color: _tabController.index != 0
                              ? Colors.white60
                              : Colors.white)),
                ),
                Tab(
                  // text: 'MORE LIKE THIS',
                  child: Text('MORE LIKE THIS',
                      style: GoogleFonts.poppins(
                          color: _tabController.index != 0
                              ? Colors.white
                              : Colors.white60)),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  EpisodesTvComponent(),
                  CustomScrollView(
                    slivers: [
                      RecommendationsTVComponent(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
        childCount: 1,

      ),
    );
  }
}
