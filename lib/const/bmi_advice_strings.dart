enum BMICategory { underweight, normalWeight, overweight }

class BMIAdviceStrings {
  static const Map<BMICategory, String> categoryTitles = {
    BMICategory.underweight: "Underweight",
    BMICategory.normalWeight: "Normal Weight",
    BMICategory.overweight: "Overweight",
  };

  static const Map<BMICategory, List<String>> calorieTips = {
    BMICategory.underweight: [
      "Consume more high-calorie foods like nuts, avocados, and healthy oils",
      "Increase portion sizes during meals",
    ],
    BMICategory.normalWeight: [
      "Maintain a balanced diet with appropriate calorie intake",
    ],
    BMICategory.overweight: [
      "Reduce high-calorie foods like sugary snacks and beverages",
      "Control portion sizes to avoid overeating",
    ],
  };

  static const Map<BMICategory, List<String>> nutrientRichFoodTips = {
    BMICategory.underweight: [
      "Focus on foods rich in protein (lean meats, fish, eggs, legumes)",
      "Include complex carbohydrates (whole grains, sweet potatoes) for sustained energy",
      "Eat plenty of fruits and vegetables for vitamins and minerals",
    ],
    BMICategory.normalWeight: [
      "Include a variety of nutrients from all food groups",
      "Focus on whole grains, lean proteins, and fresh fruits and vegetables",
    ],
    BMICategory.overweight: [
      "Focus on low-calorie, high-fiber foods like vegetables and whole grains",
      "Choose lean protein sources such as chicken, fish, and tofu",
    ],
  };
}
