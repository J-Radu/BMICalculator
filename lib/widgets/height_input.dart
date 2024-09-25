import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class HeightInput extends StatelessWidget {
  final Function(double) onHeightChanged;

  const HeightInput({Key? key, required this.onHeightChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 9, top: 20),
          child: Text(
            "Height",
            style: GoogleFonts.aDLaMDisplay(fontSize: 12),
          ),
        ),
        Container(
          width: 200,
          height: 58,
          margin: const EdgeInsets.only(left: 0),
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              double height = double.tryParse(value) ?? 0.0;
              if (height > 290.0) height = 290.0;
              onHeightChanged(height);
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            decoration: const InputDecoration(
              labelText: 'Height',
              labelStyle: TextStyle(fontSize: 13, color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
