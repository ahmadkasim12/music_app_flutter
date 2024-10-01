import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_slicing_assignment/default_theme/textbutton_theme.dart';
import 'package:ui_slicing_assignment/widgets/WidgetSlightBlur.dart';
import 'package:ui_slicing_assignment/widgets/WidgetTrack.dart';

import '../../widgets/WidgetAppbar.dart';
import '../../widgets/widget_adaptor/album_adaptor/model.dart';
import '../../widgets/widget_adaptor/album_adaptor/recommended_albums/lists.dart';
import '../../widgets/widget_adaptor/track_adaptor/model.dart';
import '../../widgets/widget_adaptor/track_adaptor/recommended_songs/lists.dart';

class LibraryMenu extends StatelessWidget {
  const LibraryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<TrackModel> recommendationTracks = suggestionList(context: context).listSongSuggestions;
    List<AlbumModel> recommendationAlbums = AlbumSuggestions().listSongSuggestions;
    return Stack(children: [
      Stack(
        children: [
          SvgPicture.asset('assets/Vector 1.svg'),
          Container(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
            child: Container(
            ),
          ))
        ],
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(125.0),
            child: WidgetAppbar(
              title: "Library",
              hasButton: true,
              leadingPath: "assets/home.svg",
              toggleSearchBar: false,
              genreListButton: true,
            )),
        body: Stack(
          children: [ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/sort_out.svg'),
                      SizedBox(
                        child: TextButton(onPressed: (){}, child: Text("Recent", style: Theme.of(context).textTheme.bodyMedium,))
                      ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recommendationTracks.length,
                        itemBuilder: (context, index) {
                          return WidgetTrack(isAlbum: false, onTap: () {}, trackData: recommendationTracks[index], isListening: false, albumData: recommendationAlbums[index]);
                        }),
                  )
                    ],
                  )
                ],
              )
            ),
          ),
            IgnorePointer(child: WidgetSlightBlur())
          ]
        )
      )
    ]);
  }
}
