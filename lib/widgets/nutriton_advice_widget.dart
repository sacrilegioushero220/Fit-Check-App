import 'package:fit_check_app/const/bmi_advice_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionAdviceWidget extends StatelessWidget {
  final BMICategory category;

  const NutritionAdviceWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final title = BMIAdviceStrings.categoryTitles[category]!;
    final calorieTips = BMIAdviceStrings.calorieTips[category]!;
    final nutrientTips = BMIAdviceStrings.nutrientRichFoodTips[category]!;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 29, 27, 31), // Background color
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),

          // Section Title: Diet and Nutrition
          Text(
            "Diet and Nutrition",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),

          // Sub-section: Eat More Calories
          if (calorieTips.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eat More Calories:",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                ...calorieTips.map((tip) => _buildBulletPoint(tip)),
              ],
            ),

          const SizedBox(height: 12.0),

          // Sub-section: Choose Nutrient-Rich Foods
          if (nutrientTips.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Nutrient-Rich Foods:",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                ...nutrientTips.map((tip) => _buildBulletPoint(tip)),
              ],
            ),
        ],
      ),
    );
  }

  // Helper method to create bullet point text
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ", // Bullet symbol
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
