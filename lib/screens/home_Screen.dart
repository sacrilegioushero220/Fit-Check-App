import 'package:fit_check_app/const/assets.dart';
import 'package:fit_check_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x001d1b1f),
        appBar: AppBar(
          backgroundColor: const Color(0x001d1b1f),
          leading: Image.asset(snackLogo),
          title: Text(
            "BMI CALCULATOR",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardButton(
                      icon: male,
                      text: "MALE",
                      dark: false,
                    ),
                    CardButton(
                      icon: female,
                      text: "FEMALE",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
