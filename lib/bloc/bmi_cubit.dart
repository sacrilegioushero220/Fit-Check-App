import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bmi_cubit_state.dart';

class BmiCubit extends Cubit<BmiCubitState> {
  BmiCubit() : super(BmiCubitInitial());

  Future<void> saveHeight(double heightInMeters) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Round to 1 decimal place
    double roundedHeight = double.parse(heightInMeters.toStringAsFixed(1));
    await prefs.setDouble("height", roundedHeight);
    print("Height (meters): $roundedHeight");
    emit(HeightSavedState());
  }

  Future<double?> fetchHeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble("height"); // Fetch in meters
  }

  Future<void> saveWeight(int weight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("weight", weight);
    print("weight: $weight");
    emit(WeightSavedState());
  }

  Future<int?> fetchWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("weight");
  }

  Future<double?> calculateBMI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final weight = await fetchWeight();
    final height = await fetchHeight();

    print("Weight: $weight");
    print("height: $height");

    if (weight != null && height != null) {
      double bmi = weight / (height * height);
      print("Calculated BMI: ${bmi.toStringAsFixed(1)}");
      return bmi;
    } else {
      print("Error: Missing weight or height for BMI calculation.");
    }
    return null;
  }
}
