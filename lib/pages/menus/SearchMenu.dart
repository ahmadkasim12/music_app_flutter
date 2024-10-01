import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_slicing_assignment/widgets/WidgetButton.dart';
import 'package:ui_slicing_assignment/widgets/WidgetDivider.dart';
import 'package:ui_slicing_assignment/widgets/WidgetSlightBlur.dart';
import 'package:ui_slicing_assignment/widgets/WidgetTrack.dart';

import '../../controller/AlbumController.dart';
import '../../controller/TrackController.dart';
import '../../widgets/WidgetAlbum.dart';
import '../../widgets/WidgetAppbar.dart';
import '../../widgets/widget_adaptor/album_adaptor/model.dart';
import '../../widgets/widget_adaptor/album_adaptor/recommended_albums/lists.dart';
import '../../widgets/widget_adaptor/track_adaptor/model.dart';
import '../../widgets/widget_adaptor/track_adaptor/recommended_songs/lists.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    List<TrackModel> recommendationTracks =
        suggestionList().listSongSuggestions;
    List<AlbumModel> recommendationAlbums =
        AlbumSuggestions().listSongSuggestions;
    final AlbumController albumController = Get.put(AlbumController());
    final TrackController trackController = Get.put(TrackController());
    trackController.initializeListeningState(recommendationTracks.length);
    albumController.initializeListeningState(recommendationAlbums.length);

    return Stack(children: [
      Stack(
        children: [
          SvgPicture.asset('assets/Vector 1.svg'),
          Container(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
            child: Container(),
          ))
        ],
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(125.0),
              child: WidgetAppbar(
                title: "Search",
                hasButton: true,
                leadingPath: "assets/home.svg",
                toggleSearchBar: true,
                genreListButton: true,
              )),
          body: Stack(children: [
            SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: Get.width),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            WidgetDivider(title: "Artist", hasButton: false),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primary,
                                    width: 1,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                      ),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(100),
                                                  child: SizedBox(
                                                    width: 65,
                                                    height: 65,
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/ab67616d0000b273b5e8de991e166a6716255e12.jpeg'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 65,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset('assets/ic_round-verified.svg'),
                                                            Text("JYOCHO", overflow: TextOverflow.fade, style: Theme.of(context).textTheme.bodyMedium,),
                                                          ],
                                                        ),
                                                        Text("11.676 followers", overflow: TextOverflow.fade, style: Theme.of(context).textTheme.bodySmall,),
                                                        Text("Artist", overflow: TextOverflow.fade, style: Theme.of(context).textTheme.bodySmall,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            WidgetButton(text: "Follow")
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(thickness: 1, color: Theme.of(context).colorScheme.primary),
                                    WidgetTrack(isAlbum: false, onTap: () {}, trackData: recommendationTracks[1], isListening: true, albumData: recommendationAlbums[1])
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    WidgetDivider(title: "Albums", hasButton: false),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: recommendationAlbums.length,
                                        itemBuilder: (context, index) {
                                            return Obx((){
                                              return WidgetAlbum(
                                                albumSearchDisplay: true,
                                                isListening: albumController.isListeningList[index],
                                                modelData: recommendationAlbums[index],
                                                onTap: () {
                                                  albumController.toggleListening(index, recommendationAlbums.length);
                                                  Get.toNamed('/album', arguments: {'albumIndex': index});
                                                },
                                              );
                                            });
                                          }
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    WidgetDivider(title: "Tracks", hasButton: false),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: recommendationTracks.length,
                                        itemBuilder: (context, index) {
                                          return Obx(() {
                                            return WidgetTrack(
                                                albumData: recommendationAlbums[index],
                                                isListening: trackController
                                                    .isListeningList[index],
                                                isAlbum: false,
                                                onTap: () {
                                                  trackController.toggleListening(
                                                      index, recommendationTracks.length);
                                                  player.play(AssetSource(recommendationTracks[index].audioPath));
                                                },
                                                trackData: recommendationTracks[index]);
                                          });
                                        })
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    )
                )
            ),
            WidgetSlightBlur()
          ]))
    ]);
  }
}
