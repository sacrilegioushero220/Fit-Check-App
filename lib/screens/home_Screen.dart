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
            left: 20.0,
            right: 20.0,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CardButton(
                          icon: male,
                          text: "MALE",
                          dark: false,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CardButton(
                          icon: female,
                          text: "FEMALE",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Expanded(
                  child: HeightSelector(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: IncrementDecrementWidget(
                          label: 'Weight',
                          unit: 'Kg',
                          minValue: 0,
                          maxValue: 120,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: IncrementDecrementWidget(
                          label: 'Age',
                          unit: 'Year',
                          minValue: 0,
                          maxValue: 120,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedRectangleButtton(
                  onPressed: () {},
                  text: "Calculate",
                  icon: male,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
