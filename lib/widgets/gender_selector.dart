import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GenderSelector extends StatelessWidget {
  final bool isMaleSelected;
  final Function(bool) onGenderChanged;

  const GenderSelector({
    Key? key,
    required this.isMaleSelected,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderButton(
          icon: Icons.male,
          label: 'Male',
          isSelected: isMaleSelected,
          onPressed: () => onGenderChanged(true),
        ),
        _buildGenderButton(
          icon: Icons.female,
          label: 'Female',
          isSelected: !isMaleSelected,
          onPressed: () => onGenderChanged(false),
        ),
      ],
    );
  }

  Widget _buildGenderButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
          backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : AppColors.primaryColor,
          size: 18,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
