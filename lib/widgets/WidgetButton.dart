import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  const WidgetButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                )
            ),
            backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          ),
          child: Text(text, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),)
      ),
    );
  }
}
