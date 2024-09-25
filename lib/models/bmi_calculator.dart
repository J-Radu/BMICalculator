import '../utils/bmi_interpreter.dart';

class BMICalculator {
  bool isMale = true;
  int weight = 70;
  int age = 22;
  double height = 0;
  double bmi = 0;
  String bmiInterpretation = "";

  String get formattedBMI => bmi.toStringAsFixed(2);

  void calculateBMI() {
    if (height > 0) {
      double heightInMeters = height / 100;
      bmi = weight / (heightInMeters * heightInMeters);
      bmiInterpretation = interpretBMI(bmi, age, isMale);
    }
  }
}
