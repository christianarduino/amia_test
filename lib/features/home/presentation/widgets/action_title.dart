import 'package:flutter/material.dart';

class ActionTitle extends StatelessWidget {
  const ActionTitle({
    super.key,
    required this.title,
    this.buttonLabel,
    this.onPressed,
  });

  final String title;
  final String? buttonLabel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (buttonLabel != null)
          ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonLabel!),
          ),
      ],
    );
  }
}
