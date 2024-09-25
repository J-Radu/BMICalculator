import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../models/bmi_calculator.dart';
import '../widgets/gender_selector.dart';
import '../widgets/height_input.dart';
import '../widgets/value_adjuster.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final BMICalculator calculator = BMICalculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            GenderSelector(
              isMaleSelected: calculator.isMale,
              onGenderChanged: (bool isMale) {
                setState(() {
                  calculator.isMale = isMale;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ValueAdjuster(
                  label: 'Weight',
                  value: calculator.weight,
                  onChanged: (int value) {
                    setState(() {
                      calculator.weight = value;
                    });
                  },
                ),
                ValueAdjuster(
                  label: 'Age',
                  value: calculator.age,
                  onChanged: (int value) {
                    setState(() {
                      calculator.age = value;
                    });
                  },
                ),
              ],
            ),
            HeightInput(
              onHeightChanged: (double value) {
                setState(() {
                  calculator.height = value;
                });
              },
            ),
            _buildResultDisplay(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 100),
            child: Text(
              "Welcome😊",
              style: GoogleFonts.notoColorEmoji(color: Colors.black),
            ),
          ),
          Text(
            "BMI Calculator",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultDisplay() {
    return Column(
      children: [
        Text(
          calculator.formattedBMI,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600
                ? MediaQuery.of(context).size.width * 0.15
                : MediaQuery.of(context).size.width * 0.05,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          calculator.bmiInterpretation,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600
                ? MediaQuery.of(context).size.width * 0.10
                : MediaQuery.of(context).size.width * 0.03,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width < 600 ? 50 : 0),
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            calculator.calculateBMI();
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Calculate BMI",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
