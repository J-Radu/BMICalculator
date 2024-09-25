String interpretBMI(double bmi, int age, bool male) {
  if (age >= 18) {
    if (bmi < 18.5) {
      return "Imponderable";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      return "Obesity class I";
    } else if (bmi >= 35 && bmi < 40) {
      return "Obesity class II";
    } else {
      return "Obesity class III";
    }
  } else {
    if (male) {
      if (bmi < 5) {
        return "Severely underweight";
      } else if (bmi >= 5 && bmi < 15) {
        return "Underweight";
      } else if (bmi >= 15 && bmi < 85) {
        return "Normal weight";
      } else if (bmi >= 85 && bmi < 95) {
        return "Overweight";
      } else {
        return "Obesity";
      }
    } else {
      if (bmi < 5) {
        return "Severely underweight";
      } else if (bmi >= 5 && bmi < 15) {
        return "Underweight";
      } else if (bmi >= 15 && bmi < 85) {
        return "Normal weight";
      } else if (bmi >= 85 && bmi < 95) {
        return "Overweight";
      } else {
        return "Obesity";
      }
    }
  }
}
