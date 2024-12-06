import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  _HeightSelectorState createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 150; // Default height
  String selectedUnit = 'Cm';

  // Min and Max values for the slider
  double minHeight = 50;
  double maxHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 45, 35), // Dark background
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Height label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Height',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['In', 'Ft', 'Cm'].map((unit) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          unit,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: selectedUnit == unit
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      selected: selectedUnit == unit,
                      onSelected: (bool selected) {
                        if (selected) {
                          setState(() {
                            selectedUnit = unit;

                            // Update min, max, and height based on selected unit
                            switch (unit) {
                              case 'In':
                                minHeight = 20; // Minimum in inches
                                maxHeight = 100; // Maximum in inches
                                height = height / 2.54; // Convert from cm to in
                                break;
                              case 'Ft':
                                minHeight = 2; // Minimum in feet
                                maxHeight = 8; // Maximum in feet
                                height =
                                    height / 30.48; // Convert from cm to ft
                                break;
                              case 'Cm':
                              default:
                                minHeight = 50; // Minimum in cm
                                maxHeight = 250; // Maximum in cm
                                height = height *
                                    (selectedUnit == 'In'
                                        ? 2.54
                                        : 30.48); // Convert back to cm
                            }
                          });
                        }
                      },
                      selectedColor: const Color.fromARGB(255, 218, 253, 135),
                      backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Height value
          Expanded(
            flex: 7,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                height.toStringAsFixed(1) +
                    (selectedUnit == 'Cm'
                        ? ' cm'
                        : selectedUnit == 'In'
                            ? ' in'
                            : ' ft'),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),

          // Slider
          Expanded(
            child: Slider(
              value: height.clamp(minHeight, maxHeight),
              min: minHeight,
              max: maxHeight,
              activeColor: const Color.fromARGB(255, 65, 80, 46),
              thumbColor: const Color.fromARGB(255, 218, 253, 135),
              inactiveColor: Colors.black,
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
