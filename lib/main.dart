import 'dart:io';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyui/data.dart';
import 'package:spotifyui/models/current_track.dart';
import 'package:spotifyui/screens/playlist_screen.dart';
import 'package:spotifyui/widgets/current_track.dart';
import 'package:spotifyui/widgets/sidemenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone UI',
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color(0xFF121212),
          backgroundColor: const Color(0xFF121212),
          primaryColor: Colors.black,
          accentColor: const Color(0xFF1DB954),
          iconTheme: const IconThemeData().copyWith(color: Colors.white),
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
              headline2: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              headline4: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0),
              bodyText1: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0))),
      debugShowCheckedModeBanner: false,
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideMenu(),
                const Expanded(
                    child: PlaylistScreen(
                  playlist: lofihiphopPlaylist,
                ))
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
