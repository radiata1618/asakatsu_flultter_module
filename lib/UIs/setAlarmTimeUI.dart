import 'package:asakatsu_flultter_module/UIs/setAlarmTimeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/UI/commonButtonUI.dart';
import '../common/UI/commonOthersUI.dart';
import '../common/UI/commonTextUI.dart';

class SetAlarmTime extends ConsumerWidget {
  const SetAlarmTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return commonScaffold(
      context,
      ref,
      MainAxisAlignment.start,
      [
        Column(
          children: [
            commonText16BlackLeft("Edit alarm time"),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: ref.watch(setAlarmTimeProvider).alarmTime,
                onDateTimeChanged: (DateTime value) {
                  ref.read(setAlarmTimeProvider.notifier).setAlarmTime(value);
                },
              ),
            ),
            commonButtonSecondaryColorRound(
                text: "Save",
                onPressed: () async{
                  await ref.read(setAlarmTimeProvider.notifier).insertOrUpdateAlarmTime();
                  Navigator.pop(context);
                })
          ],
        )
      ],
    );
  }
}
