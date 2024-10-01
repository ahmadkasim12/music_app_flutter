import '../track_adaptor/model.dart';

class AlbumModel {
  final String albumCover, albumPath, title, artist, year;
  final List<TrackModel> trackModel;

  AlbumModel({required this.albumCover, required this.albumPath, required this.title, required this.artist, required this.year, required this.trackModel});
}