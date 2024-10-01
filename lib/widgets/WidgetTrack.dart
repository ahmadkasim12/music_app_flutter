import 'package:flutter/material.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/album_adaptor/model.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/model.dart';

class WidgetTrack extends StatelessWidget {
  final TrackModel trackData;
  final AlbumModel albumData;
  final bool isAlbum;
  final VoidCallback onTap;
  final bool isListening;
  const WidgetTrack({super.key, required this.isAlbum, required this.onTap, required this.trackData, required this.isListening, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: isListening ? Border.all(
                color: Colors.white24,
                width: 1
            ) : Border.all(
                color: Colors.transparent,
                width: 0
            ),
            color: isListening ? Colors.white10 : Colors.transparent
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      width: 65,
                      child: Image(
                        image: AssetImage(trackData.albumPath),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 240),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isAlbum ? Text(albumData.title, overflow: TextOverflow.fade,) : Text(trackData.title, overflow: TextOverflow.fade),
                          isAlbum ? Text("Album • ${albumData.artist}", style: Theme.of(context).textTheme.bodySmall,) : Text(trackData.subTitle, style: Theme.of(context).textTheme.bodySmall,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              isAlbum ? Container() : Text(trackData.duration, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}