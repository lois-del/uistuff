import 'package:flutter/material.dart';
import 'package:spotifyui/data.dart';
import 'package:spotifyui/models/current_track.dart';
import 'package:provider/provider.dart';

class Trackslist extends StatelessWidget {
  final List<Song> tracks;

  const Trackslist({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        showCheckboxColumn: false,
        dataRowHeight: 54.0,
        columns: const [
          DataColumn(
            label: Text('TITLE'),
          ),
          DataColumn(label: Text('ARTISTE')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(label: Icon(Icons.access_time))
        ],
        rows: tracks.map((e) {
          final selected =
              context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(
              cells: [
                DataCell(Text(e.title, style: textStyle)),
                DataCell(Text(e.artist, style: textStyle)),
                DataCell(Text(e.album, style: textStyle)),
                DataCell(Text(e.duration, style: textStyle)),
              ],
              selected: selected,
              onSelectChanged: (_) =>
                  context.read<CurrentTrackModel>().selectTrack(e));
        }).toList());
  }
}
