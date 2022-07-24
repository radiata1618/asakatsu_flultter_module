import 'package:asakatsu_flultter_module/UIs/setAlarmTimePatternProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/UI/commonButtonUI.dart';
import '../common/UI/commonOthersUI.dart';
import '../common/UI/commonTextUI.dart';

class SetGoToBedTime extends ConsumerWidget {
  const SetGoToBedTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(setAlarmTimePatternProvider.notifier).setGoToBedTime(DateTime(0, 0, 0,  23, 0));
    DateTime goToBedTimeInitial =
        ref.watch(setAlarmTimePatternProvider).goToBedTime == null
            ? DateTime(0, 0, 0,  23, 0)
            : ref.watch(setAlarmTimePatternProvider).goToBedTime!;
    return commonScaffold(
      context,
      ref,
      MainAxisAlignment.start,
      [
        Column(
          children: [
            commonText16BlackLeft("Edit go to bed time"),
            SizedBox(
              height: 100,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: goToBedTimeInitial,
                onDateTimeChanged: (DateTime value) {
                  ref
                      .read(setAlarmTimePatternProvider.notifier)
                      .setGoToBedTime(value);
                },
              ),
            ),
            commonButtonSecondaryColorRound(
                text: "Save",
                onPressed: () async {
                  await ref
                      .read(setAlarmTimePatternProvider.notifier)
                      .updateIsarAlarmPatternCall();
                  Navigator.pop(context);
                })
          ],
        )
      ],
    );
  }
}
