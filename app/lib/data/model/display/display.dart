import 'dart:ui';

class Display {
  late List<String> plan;
  late List<double> weights;
  late List<String> losses;
  Display() {
    this.plan = [
      "Maintain weight",
      "Mild weight loss",
      "Weight loss",
      "Extreme weight loss"
    ];
    this.weights = [1, 0.9, 0.8, 0.6];
    this.losses = ['-0 kg/week', '-0.25 kg/week', '-0.5 kg/week', '-1 kg/week'];
  }
  double getWeightLoss(String option) {
    return this.weights[this.plan.indexOf(option)];
  }

  Map<String, dynamic> getMealsPerc(int numberOfMeal) {
    if (numberOfMeal == 3) {
      return {'breakfast': 0.35, 'lunch': 0.40, 'dinner': 0.25};
    } else if (numberOfMeal == 4) {
      return {
        'breakfast': 0.30,
        'morning snack': 0.05,
        'lunch': 0.40,
        'dinner': 0.25
      };
    } else {
      return {
        'breakfast': 0.30,
        'morning snack': 0.05,
        'lunch': 0.40,
        'afternoon snack': 0.05,
        'dinner': 0.20
      };
    }
  }
}
