import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  Widget? child;
  CardWidget({
    super.key,
    this.height = 200,
    this.width = 195,
    this.color = const Color.fromARGB(255, 95, 105, 83),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
      ),
      child: child,
    );
  }
}
