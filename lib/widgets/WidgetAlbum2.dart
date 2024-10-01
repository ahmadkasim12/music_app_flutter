import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/album_adaptor/model.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/track_adaptor/model.dart';

class WidgetAlbum2 extends StatelessWidget {
  final bool isListening;
  final AlbumModel albumData;
  final VoidCallback onTap;
  const WidgetAlbum2({super.key, required this.albumData, required this.onTap, required this.isListening});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: isListening ? Theme.of(context).colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: isListening ? Border.all(
                color: Colors.white24,
                width: 1
            ) : Border.all()
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.circular(5),
                child: SizedBox(
                  width: 105,
                  height: 105,
                  child: Image(
                    image: AssetImage(albumData.albumCover),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(albumData.title, overflow: TextOverflow.fade,),
                        Text(albumData.artist, style: Theme.of(context).textTheme.bodySmall,),
                        Text("Album • ${albumData.year}", style: Theme.of(context).textTheme.bodySmall,)
                      ],
                    ),
                  )
              ),
              TextButton(
                  onPressed: (){},
                  child: SvgPicture.asset('assets/pencil_dots.svg')
              )
            ],
          ),
        ),
      ),
    );
  }
}
