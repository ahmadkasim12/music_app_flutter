import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_slicing_assignment/default_theme/textbutton_theme.dart';
import 'package:ui_slicing_assignment/widgets/WidgetButton.dart';

class WidgetAppbar extends StatelessWidget {
  final String leadingPath, title;
  final bool toggleSearchBar, genreListButton;
  final bool hasButton;
  const WidgetAppbar(
      {super.key,
      required this.leadingPath,
      required this.title,
      required this.hasButton,
      required this.toggleSearchBar,
      required this.genreListButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  toggleSearchBar
                      ? Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 280,
                                  height: 44,
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                        ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  )),
                              hasButton
                                  ? SizedBox(
                                      width: 44,
                                      height: 44,
                                      child: TextButtonTheme(
                                        data: DefaultTextButtonTheme(context: context).white,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: SvgPicture.asset('assets/search.svg')
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 50,
                                    )
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            Wrap(
                              spacing: 10,
                              children: [
                                SvgPicture.asset(leadingPath),
                                Text(title,
                                    style: Theme.of(context).textTheme.displayLarge)
                              ],
                            ),
                            Spacer(),
                            hasButton
                                ? SizedBox(
                              width: 44,
                              height: 44,
                              child: TextButtonTheme(
                                data: DefaultTextButtonTheme(context: context).white,
                                child: TextButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset('assets/search.svg')
                                ),
                              ),
                            )
                                : SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                  genreListButton ? Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 44,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          WidgetButton(text: "Top"),
                          WidgetButton(text: "Track"),
                          WidgetButton(text: "Album"),
                          WidgetButton(text: "Playlist"),
                          WidgetButton(text: "Artist"),
                        ],
                      ),
                    ),
                  ) : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
