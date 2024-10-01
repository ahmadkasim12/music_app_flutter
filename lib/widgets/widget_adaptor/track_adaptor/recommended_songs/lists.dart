import 'package:flutter/cupertino.dart';

import '../model.dart';

class suggestionList {
  final BuildContext context;

  suggestionList({required this.context});

  List<TrackModel> get listSongSuggestions => [
        TrackModel(
          albumPath: 'assets/track/Persona 4 Album/album.jpg',
          title: "Time To Make History",
          subTitle: "Shihoko Hirata",
          audioPath:
              "track/Persona 4 Album/Shihoko Hirata - Time To Make History.mp3",
          duration: "2:43",
        ),
        TrackModel(
          albumPath: 'assets/track/Persona 4 Album/album.jpg',
          title: "A Sky Full Of Stars",
          subTitle: "ATLUS Sound Team",
          audioPath:
              "track/Persona 4 Album/ATLUS Sound Team - A Sky Full Of Stars.mp3",
          duration: "2:46",
        ),
        TrackModel(
          albumPath: 'assets/track/Persona 4 Album/album2.jpg',
          title: "Heartbeat, Heartbreak",
          subTitle: "Shihoko Hirata",
          audioPath:
              "track/Persona 4 Album/Shihoko Hirata - Heartbeat, Heartbreak.mp3",
          duration: "4:21",
        ),
        TrackModel(
          albumPath: 'assets/track/Persona 4 Album/album2.jpg',
          title: "Reach Out To The Truth",
          subTitle: "Shihoko Hirata",
          audioPath: "track/Persona 4 Album/平田志穂子 - Reach Out To The Truth.mp3",
          duration: "4:05",
        ),
      ];
}
