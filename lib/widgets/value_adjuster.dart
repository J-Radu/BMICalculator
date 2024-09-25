import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ValueAdjuster extends StatelessWidget {
  final String label;
  final int value;
  final Function(int) onChanged;

  const ValueAdjuster({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(label),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "$value",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAdjustButton(Icons.remove, () => onChanged(value - 1)),
              const Padding(padding: EdgeInsets.all(20)),
              _buildAdjustButton(Icons.add, () => onChanged(value + 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdjustButton(IconData icon, VoidCallback onPressed) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(10, 10),
      ),
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
