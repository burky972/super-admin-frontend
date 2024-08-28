import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LicenseDurationUpdateCubit extends Cubit<LicenseDurationUpdateState> {
  LicenseDurationUpdateCubit() : super(LicenseDurationUpdateInitial());

  void selectEndDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(initialDate.year - 2);
    DateTime lastDate = DateTime(initialDate.year + 10);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      emit(LicenseDurationUpdateSelected(picked));
    }
  }

  void updateEndDate(BuildContext context) {
    if (state is LicenseDurationUpdateSelected) {
      final selectedEndDate = (state as LicenseDurationUpdateSelected).selectedEndDate;
      Navigator.pop(context, selectedEndDate);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lütfen bir tarih seçin."),
        ),
      );
    }
  }
}

abstract class LicenseDurationUpdateState {}

class LicenseDurationUpdateInitial extends LicenseDurationUpdateState {}

class LicenseDurationUpdateSelected extends LicenseDurationUpdateState {
  final DateTime selectedEndDate;

  LicenseDurationUpdateSelected(this.selectedEndDate);
}
