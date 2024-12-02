import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final String label;
  final String unit;
  final int minValue;
  final int maxValue;

  const IncrementDecrementWidget({
    super.key,
    required this.label,
    required this.unit,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 45, 35), // Dark background
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 40,
        bottom: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Label
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),

          // Increment/Decrement and Value
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Decrement Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // context.read<WeightAgeCubit>().decrement(minValue);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 218, 253, 135),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12.0),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "65",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              // Increment Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // context.read<WeightAgeCubit>().increment(maxValue);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 218, 253, 135),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12.0),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Unit Label
          Expanded(
            child: Text(
              unit,
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
