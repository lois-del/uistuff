import 'package:flutter/material.dart';
import 'package:spotifyui/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/spotify-Logo.png',
                  height: 65.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _sideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          _sideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _sideMenuIconTab(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(
            height: 10.0,
          ),
          _LibraryPlaylist()
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _sideMenuIconTab extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const _sideMenuIconTab(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  __LibraryPlaylistState createState() => __LibraryPlaylistState();
}

class __LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          physics: ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ))
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'YOUR PLAYLIST',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
