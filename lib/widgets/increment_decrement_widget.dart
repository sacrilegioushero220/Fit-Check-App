import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final String label;
  final String unit;
  final int minValue;
  final int maxValue;
  final int value; // Current value
  final VoidCallback onIncrement; // Callback for increment
  final VoidCallback onDecrement; // Callback for decrement

  const IncrementDecrementWidget({
    super.key,
    required this.label,
    required this.unit,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
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
                  onPressed: value > minValue ? onDecrement : null,
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
                  value.toString(),
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
                  onPressed: value < maxValue ? onIncrement : null,
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
