import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/albums/%E3%83%8D%E3%83%90%E3%83%BC%E3%83%BB%E3%83%A2%E3%82%A2-%E3%80%8E%E3%83%9A%E3%83%AB%E3%82%BD%E3%83%8A4%E3%80%8F%E8%BC%AA%E5%BB%BB%E8%BB%A2%E7%94%9F-/albums.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/albums/%E7%BE%8E%E3%81%97%E3%81%84%E7%B5%82%E6%9C%AB%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB/albums.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/albums/air_ni_ni/albums.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/albums/blossom_tea_time/album.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/albums/sugar_sweets_symphony/album.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/recommended_songs/lists.dart';

import '../model.dart';

class AlbumSuggestions {
  List<AlbumModel> get listSongSuggestions => [
    AlbumModel(
        albumCover: "assets/track/Mitsukiyo - Blossom Tea Time/cover.jpg",
        albumPath: '/album',
        title: "Blossom Tea Time",
        artist: "ミツキヨ",
        year: "2022",
        trackModel: BlossomTeaTime().songLists
    ),
    AlbumModel(
      albumCover: "assets/track/sugar sweets symphony/cover.jpg",
      albumPath: '/album',
      title: "sugar sweet symphony!",
      artist: "AAAA, Umeboshi Chazuke",
      year: "2023",
      trackModel: SugarSweetsSymphony().songLists,
    ),
    AlbumModel(
        albumCover: "assets/track/Air Ni Ni/cover.jpeg",
        albumPath: '/album',
        title: "Air Ni Ni",
        artist: "Hakushi Hasegawa",
        year: "2021",
      trackModel: AirNiNi().songLists
    ),
    AlbumModel(
        albumCover: "assets/track/美しい終末サイクル/cover.jpeg",
        albumPath: '/album',
        title: "美しい終末サイクル",
        artist: "JYOCHO",
        year: "2021",
        trackModel: JyochoAlbum1().songLists
    ),
    AlbumModel(
        albumCover: "assets/track/ネバー・モア-『ペルソナ4』輪廻転生-/cover.jpg",
        albumPath: '/album',
        title: "ネバー・モア-『ペルソナ4』輪廻転生-",
        artist: "アトラスサウンドチーム",
        year: "2012",
        trackModel: Persona4Album().songLists
    ),
  ];
}