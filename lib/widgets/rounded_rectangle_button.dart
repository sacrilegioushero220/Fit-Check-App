import 'package:fit_check_app/const/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedRectangleButtton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String icon;

  const RoundedRectangleButtton({
    required this.onPressed,
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(
              255, 218, 253, 135), // Button background color
          padding: const EdgeInsets.symmetric(
              horizontal: 40, vertical: 16), // Button size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13), // Rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.black, // Text color
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8), // Space between text and icon
            Image.asset(reload),
          ],
        ),
      ),
    );
  }
}
