import 'package:flutter/material.dart';
import 'package:ui_slicing_assignment/widgets/widget_adaptor/album_adaptor/model.dart';

class WidgetAlbum extends StatelessWidget {
  final AlbumModel modelData;
  final VoidCallback onTap;
  final bool isListening;
  const WidgetAlbum({super.key, required this.onTap, required this.modelData, required this.isListening});

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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    child: SizedBox(
                      width: 150,
                      child: Image(
                        image: AssetImage(modelData.albumCover),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(modelData.title, overflow: TextOverflow.ellipsis,),
                      Text("Album • ${modelData.artist}", style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
