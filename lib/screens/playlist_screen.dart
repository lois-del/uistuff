import 'package:flutter/material.dart';
import 'package:spotifyui/data.dart';
import 'package:spotifyui/widgets/playlistHeader.dart';
import 'package:spotifyui/widgets/trackslist.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color),
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            label: Text('Lois'),
          ),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 30.0,
              )),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.3],
                colors: [Colors.red, Theme.of(context).backgroundColor])),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              Trackslist(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}
