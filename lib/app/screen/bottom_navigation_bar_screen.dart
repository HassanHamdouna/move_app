import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_app/movies/presentation/screens/movies_screen.dart';
import 'package:move_app/tvs/presentation/screens/tv_screen.dart';

import '../model/bn_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;
  final List<BnScreen> _screen = <BnScreen>[
    BnScreen(widgetScreen: const MoviesScreen()),
    BnScreen(widgetScreen: const TvScreen()),
  ];

  late ConnectivityResult _connectivityResult;
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  var isConnected = true; // Assume there's an initial connection

  @override
  void initState() {
    super.initState();
    checkInternet();
    startS();
  }

  Future<void> checkInternet() async {
    _connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = _connectivityResult != ConnectivityResult.none;
    });
  }

  void startS() {
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((event) async {
          checkInternet();
        });
  }

  @override
  void dispose() {
    _streamSubscription.cancel(); // Dispose of the stream subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: isConnected
          ? _screen[_currentIndex].widgetScreen
          :  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Icon(Icons.wifi_off,color: Colors.red,size: 100,),
            const SizedBox(
              height: 30,
            ),
            Text('Please check your internet connection.',style: GoogleFonts.poppins(
              fontSize: 18,
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: NavigationBar(
          height: 60,
          animationDuration: const Duration(milliseconds: 2000),
          elevation: 5,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.grey.shade900,
          selectedIndex: _currentIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.movie, color: Colors.white),
              icon: Icon(Icons.movie, color: Colors.white),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.tv, color: Colors.white),
              icon: Icon(Icons.tv, color: Colors.white),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
