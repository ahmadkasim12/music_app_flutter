import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/AlbumController.dart';
import '../widgets/WidgetTrack.dart';
import '../widgets/widget_adaptor/album_adaptor/model.dart';
import '../widgets/widget_adaptor/album_adaptor/recommended_albums/lists.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int albumIndex = Get.arguments['albumIndex'];
    List<AlbumModel> recommendationAlbums = AlbumSuggestions().listSongSuggestions;
    final player = AudioPlayer();
    final AlbumController albumController = Get.put(AlbumController());
    albumController.initializeListeningState(AlbumSuggestions().listSongSuggestions[albumIndex].trackModel.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: AlbumSuggestions().listSongSuggestions[albumIndex].trackModel.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return WidgetTrack(
                      isListening: albumController.isListeningList[index],
                      isAlbum: false,
                      onTap: () {
                        albumController.toggleListening(index, AlbumSuggestions().listSongSuggestions[albumIndex].trackModel.length);
                        player.play(AssetSource(AlbumSuggestions().listSongSuggestions[albumIndex].trackModel[index].audioPath));
                      },
                      trackData: AlbumSuggestions().listSongSuggestions[albumIndex].trackModel[index]);
                });
              }),
        ),
      ),
    );
  }
}
