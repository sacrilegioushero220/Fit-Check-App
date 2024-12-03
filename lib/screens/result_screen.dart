import 'package:fit_check_app/const/assets.dart';
import 'package:fit_check_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 31),
      appBar: AppBar(
        backgroundColor: const Color(0x001d1b1f),
        leading: const BackButton(
          color: Colors.white, // Customize color if needed
        ),
        centerTitle: true,
        title: Text(
          "Result",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
