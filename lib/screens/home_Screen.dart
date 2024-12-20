import 'package:fit_check_app/bloc/bmi_cubit.dart';
import 'package:fit_check_app/const/assets.dart';
import 'package:fit_check_app/screens/result_screen.dart';
import 'package:fit_check_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMaleSelected = true;
  bool _isFemaleSelected = false;

  int weight = 65; // Initial weight
  int age = 25; // Initial age

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x001d1b1f),
        appBar: AppBar(
          backgroundColor: const Color(0x001d1b1f),
          leading: Image.asset(snackLogo),
          title: Text(
            "BMI CALCULATOR",
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CardButton(
                          icon: male,
                          text: "MALE",
                          isSelected: _isMaleSelected,
                          onTap: () {
                            setState(() {
                              _isFemaleSelected = false;
                              _isMaleSelected = true;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CardButton(
                          icon: female,
                          text: "FEMALE",
                          isSelected: _isFemaleSelected,
                          onTap: () {
                            setState(() {
                              _isFemaleSelected = true;
                              _isMaleSelected = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Expanded(
                  child: HeightSelector(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: IncrementDecrementWidget(
                          label: 'Weight',
                          unit: 'Kg',
                          minValue: 0,
                          maxValue: 120,
                          value: weight,
                          onIncrement: () {
                            setState(() {
                              weight++;
                              BlocProvider.of<BmiCubit>(context)
                                  .saveWeight(weight);
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              weight--;
                              BlocProvider.of<BmiCubit>(context)
                                  .saveWeight(weight);
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: IncrementDecrementWidget(
                          label: 'Age',
                          unit: 'Year',
                          minValue: 0,
                          maxValue: 120,
                          value: age,
                          onIncrement: () {
                            setState(() {
                              age++;
                              // BlocProvider.of<BmiCubit>(context).saveAge(age);
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              age--;
                              //BlocProvider.of<BmiCubit>(context).saveAge(age);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedRectangleButtton(
                  onPressed: () async {
                    final bmi =
                        await BlocProvider.of<BmiCubit>(context).calculateBMI();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmiValue: bmi ?? 0.0,
                        ),
                      ),
                    );
                  },
                  text: "Calculate",
                  icon: female,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
