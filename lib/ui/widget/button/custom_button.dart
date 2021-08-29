import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final Icon icon;
  final Color color;
  const CustomButton({
    Key? key, required this.onPress, required this.icon, required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: IconButton(
          onPressed: onPress,
          icon: icon,
        ));
  }
}