part of 'bmi_cubit.dart';

@immutable
sealed class BmiCubitState {}

final class BmiCubitInitial extends BmiCubitState {}

final class HeightSavedState extends BmiCubitState {}

final class ErrorState extends BmiCubitState {}

final class WeightSavedState extends BmiCubitState {}

final class BmiCalculatedState extends BmiCubitState {}
