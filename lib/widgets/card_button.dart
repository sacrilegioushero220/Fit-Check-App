import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets.dart';

class CardButton extends StatelessWidget {
  final String icon;
  final String text;

  bool isSelected;
  final void Function()? onTap;
  CardButton({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CardWidget(
        color: isSelected
            ? const Color.fromARGB(255, 65, 80, 46)
            : const Color.fromARGB(255, 40, 45, 35),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              const SizedBox(
                height: 3,
              ),
              Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
