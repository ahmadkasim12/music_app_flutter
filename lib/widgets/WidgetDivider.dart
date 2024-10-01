import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetDivider extends StatelessWidget {
  final String title;
  final bool hasButton;
  const WidgetDivider({super.key, required this.title, required this.hasButton});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          )),
          hasButton ? TextButton(
              onPressed: () {},
              child: SvgPicture.asset('assets/arrowleft.svg')
          ) : SizedBox()
        ],
      ),
      Divider(
        height: 20,
        color: Colors.white10,
        thickness: 1,
      )
    ]);
  }
}
