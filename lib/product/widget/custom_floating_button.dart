import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? tag;
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
