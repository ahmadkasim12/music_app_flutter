import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_slicing_assignment/controller/AlbumController.dart';
import 'package:ui_slicing_assignment/widgets/WidgetAlbum.dart';
import 'package:ui_slicing_assignment/widgets/WidgetAppbar.dart';
import 'package:ui_slicing_assignment/widgets/WidgetDivider.dart';
import 'package:ui_slicing_assignment/widgets/WidgetSlightBlur.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/model.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/recommended_songs/lists.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/album_adaptor/recommended_albums/lists.dart';
import 'package:ui_slicing_assignment/widgets/WidgetTrack.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../controller/TrackController.dart';
import '../../widgets/widget_adaptor/album_adaptor/model.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<TrackModel> recommendationTracks =
        suggestionList(context: context).listSongSuggestions;
    List<AlbumModel> recommendationAlbums =
        AlbumSuggestions().listSongSuggestions;
    final player = AudioPlayer();
    final TrackController trackController = Get.put(TrackController());
    final AlbumController albumController = Get.put(AlbumController());
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
            preferredSize: const Size.fromHeight(60.0),
            child: WidgetAppbar(title: "Welcome, user!", hasButton: true, leadingPath: "assets/home.svg", toggleSearchBar: false, genreListButton: false,)
          ),
          body: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/ab67616d0000b273090c7f1e51b860b5bd6a14ce.jpeg')),
                                border: Border.all(
                                    color: Colors.white24, width: 1)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                AspectRatio(
                                  aspectRatio: 65 / 32,
                                  child: Expanded(child: Container()),
                                ),
                                Expanded(
                                    child: ClipRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "ミツキヨ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                                Text(
                                                  "Yume no Kissaten",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                ),
                                              ],
                                            ),
                                            AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onTertiary,
                                                ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          WidgetDivider(title: "Similar album that you might like", hasButton: true,),
                          SizedBox(
                            width: Get.width,
                            height:
                                214, // You can adjust this height to your needs
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: recommendationAlbums.length,
                              shrinkWrap:
                                  true, // Let it wrap content height-wise
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return SizedBox(
                                    // Set a fixed width for each item
                                    width:
                                        150, // Adjust this width based on your design
                                    child: WidgetAlbum(
                                      isListening: albumController.isListeningList[index],
                                      onTap: () {
                                        albumController.toggleListening(
                                            index, recommendationAlbums.length);
                                      },
                                      modelData: recommendationAlbums[index],
                                    ),
                                  );
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          WidgetDivider(title: "Songs that you might like", hasButton: true,),
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
                    )
                  ],
                ),
              ),
            ),
            WidgetSlightBlur()
          ])),
    ]);
  }
}
