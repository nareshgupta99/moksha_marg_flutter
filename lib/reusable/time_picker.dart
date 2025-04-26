import 'package:flutter/material.dart';

Future<void> timePicker(BuildContext context,
    {required TimeOfDay selectedTime}) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child!,
      );
    },
  );
}

String _formatTime(TimeOfDay time) {
  final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minutes = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return "$hours:$minutes $period";
}
