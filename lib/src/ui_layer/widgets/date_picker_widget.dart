import 'package:flutter/material.dart';

class AppDatePicker{

  datePickerRoute(
      BuildContext context,
      ) {
    return showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1990), lastDate: DateTime(3000),
    );
  }
}