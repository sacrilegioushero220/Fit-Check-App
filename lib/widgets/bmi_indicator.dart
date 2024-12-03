import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIIndicator extends StatelessWidget {
  final double bmiValue; // BMI value
  final String category; // BMI category
  final double progress; // Progress value (0.0 to 1.0)

  const BMIIndicator({
    super.key,
    required this.bmiValue,
    required this.category,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 45, 35), // Background color
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Row: BMI Label and Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your BMI is",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                category,
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 218, 253, 135),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // BMI Value (Large Text in the Center)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              bmiValue.toStringAsFixed(1),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Progress Bar (Colored Background with Slider-like Indicator)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 8.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.green, // Healthy BMI range
                      Colors.yellow, // Overweight BMI range
                      Colors.red, // Obese BMI range
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Align(
                alignment: Alignment(
                  (progress * 2) -
                      1, // Convert progress (0.0 to 1.0) to alignment (-1 to 1)
                  0.0,
                ),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 218, 253, 135),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
