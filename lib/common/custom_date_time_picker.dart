import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/style.dart';

class CustomDateTimePicker {
  Future picker({
    required BuildContext context,
    required DateTime init,
    required String title,
    required Function(DateTime) onChanged,
    bool datetime = true,
  }) async {
    await showBoardDateTimePicker(
      context: context,
      pickerType:
          datetime ? DateTimePickerType.datetime : DateTimePickerType.date,
      initialDate: init,
      minimumDate: kFirstDate,
      maximumDate: kLastDate,
      options: BoardDateTimeOptions(
        languages: const BoardPickerLanguages.ja(),
        showDateButton: false,
        boardTitle: title,
      ),
      radius: 8,
      onChanged: onChanged,
    );
  }
}
