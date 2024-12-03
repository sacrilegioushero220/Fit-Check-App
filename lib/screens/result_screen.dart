import 'package:fit_check_app/const/assets.dart';
import 'package:fit_check_app/const/bmi_advice_strings.dart';
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
      body: const Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            BMIIndicator(
              bmiValue: 18.7, // Example BMI value
              category: "Underweight", // Example category
              progress: 0.2,
            )
            // Example progress (0.0 to 1.0))

            ,
            SizedBox(
              height: 20,
            ),
            NutritionAdviceWidget(category: BMICategory.overweight),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
