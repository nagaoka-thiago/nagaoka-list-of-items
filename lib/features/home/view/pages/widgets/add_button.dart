import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function() onPressed;
  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor: Colors.blue, child: IconButton(onPressed: onPressed, icon: const Icon(Icons.add)));
  }
}