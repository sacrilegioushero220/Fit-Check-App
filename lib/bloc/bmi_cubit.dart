import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_cubit_state.dart';

class BmiCubitCubit extends Cubit<BmiCubitState> {
  BmiCubitCubit() : super(BmiCubitInitial());
}
