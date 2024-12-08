import 'package:fit_check_app/const/bmi_advice_strings.dart';
import 'package:fit_check_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final double bmiValue;

  const ResultScreen({
    super.key,
    required this.bmiValue,
  });

  @override
  Widget build(BuildContext context) {
    // Determine BMI category based on the value
    final BMICategory category = _getBMICategory(bmiValue);

    // Calculate progress for the indicator (example scaling, adjust as needed)
    final double progress = (bmiValue / 40).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 27, 31),
      appBar: AppBar(
        backgroundColor: const Color(0x001d1b1f),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            // BlocProvider.of<BmiCubit>(context).clearStorage();

            Navigator.pop(context);
          },
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
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            BMIIndicator(
              bmiValue: bmiValue,
              category: BMIAdviceStrings.categoryTitles[category]!,
              progress: progress,
            ),
            const SizedBox(height: 20),
            NutritionAdviceWidget(category: category),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  // Method to determine BMI category based on the value
  BMICategory _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return BMICategory.underweight;
    } else if (bmi < 25.0) {
      return BMICategory.normalWeight;
    } else {
      return BMICategory.overweight;
    }
  }
}
