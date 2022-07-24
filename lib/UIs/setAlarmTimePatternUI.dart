import 'package:asakatsu_flultter_module/UIs/setAlarmTimePatternProvider.dart';
import 'package:asakatsu_flultter_module/UIs/setAlarmTimeProvider.dart';
import 'package:asakatsu_flultter_module/UIs/setAlarmTimeUI.dart';
import 'package:asakatsu_flultter_module/UIs/setGoToBedTimeUI.dart';
import 'package:asakatsu_flultter_module/daoIsar/alarmPatternDaoIsar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/UI/commonButtonUI.dart';
import '../common/UI/commonOthersUI.dart';
import '../common/UI/commonPushUI.dart';
import '../common/UI/commonTextFormUI.dart';
import '../common/UI/commonTextUI.dart';
import '../common/commonValues.dart';
import '../common/logic/commonLogicOthers.dart';
import '../daoIsar/alarmDaoIsar.dart';
import '../entityIsar/alarmEntityIsar.dart';
import '../entityIsar/alarmPatternEntityIsar.dart';

class SetAlarmTimePattern extends ConsumerWidget {
  SetAlarmTimePattern({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: commonAppTabBar(),
      body: alarmList(context, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(setAlarmTimeProvider.notifier).initialize(
              1, ref.watch(setAlarmTimePatternProvider).patternId, null);
          await commonNavigatorPushSlideHorizon(context, const SetAlarmTime());
          ref.read(setAlarmTimePatternProvider.notifier).rebuildScreen();
        },
        tooltip: 'Increment' +
            ref
                .watch(setAlarmTimePatternProvider)
                .dummyVariableForRebuild
                .toString(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget alarmList(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: selectIsarAlarmByPatternId(
          ref.watch(setAlarmTimePatternProvider).patternId),
      builder: (BuildContext context, AsyncSnapshot<List<Alarm>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Column(
            children: [
              commonText16BlackLeft("Edit alarm pattern"),
              commonTextBoxBordered(
                  initialValue:
                      ref.watch(setAlarmTimePatternProvider).patternName,
                  text: 'Pattern name',
                  onChanged: (String value) async {
                    ref
                        .read(setAlarmTimePatternProvider.notifier)
                        .setPatternName(value);
                  }),
              commonVerticalGap(),
              rowOfdaysOfWeekButton(ref),
              commonVerticalGap(),
              goToBedSetting(context, ref),
              commonText16BlackLeft("アラーム"),
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return alarmListUnit(snapshot.data![index], context, ref);
                    }),
              ),
              commonButtonSecondaryColorRound(
                  text: "Save",
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        } else {
          return Column(
            children: [
              commonText16BlackLeft("Edit alarm pattern"),
              commonTextBoxBordered(
                  initialValue:
                      ref.watch(setAlarmTimePatternProvider).patternName,
                  text: 'Pattern name',
                  onChanged: (String value) async {
                    ref
                        .read(setAlarmTimePatternProvider.notifier)
                        .setPatternName(value);
                  }),
              commonVerticalGap(),
              rowOfdaysOfWeekButton(ref),
              commonVerticalGap(),
              goToBedSetting(context, ref),
              commonText16BlackLeft("アラーム"),
              commonVerticalGap(),
              const SizedBox(height: 30, child: Text("Add alarm time")),
              commonButtonSecondaryColorRound(
                  text: "Save",
                  onPressed: () async {
                    // await updateIsarAlarmPattern(
                    //     id: ref.watch(setAlarmTimePatternProvider).patternId,
                    //     patternName:
                    //         ref.watch(setAlarmTimePatternProvider).patternName,
                    //     monday: ref.watch(setAlarmTimePatternProvider).monday,
                    //     tuesday: ref.watch(setAlarmTimePatternProvider).tuesday,
                    //     wednesday:
                    //         ref.watch(setAlarmTimePatternProvider).wednesday,
                    //     thursday:
                    //         ref.watch(setAlarmTimePatternProvider).thursday,
                    //     friday: ref.watch(setAlarmTimePatternProvider).friday,
                    //     saturday:
                    //         ref.watch(setAlarmTimePatternProvider).saturday,
                    //     sunday: ref.watch(setAlarmTimePatternProvider).sunday, goToBedTime: ref.watch(setAlarmTimePatternProvider).goToBedTime);
                    Navigator.pop(context);
                  })
            ],
          );
        }
      },
    );
  }

  Widget goToBedSetting(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Container(
        child: commonText16BlackLeft("前日の就寝時間"),
      ),
      GestureDetector(
        child: Card(
          child: Container(
              color: Colors.white,
              height: 50,
              child: ref.watch(setAlarmTimePatternProvider).goToBedTime == null
                  ? commonText16BlackLeft("未設定")
                  : commonText16BlackLeft(
                      "${zeroAddTo2Digit(ref.watch(setAlarmTimePatternProvider).goToBedTime!.hour.toString())}:${zeroAddTo2Digit(ref.watch(setAlarmTimePatternProvider).goToBedTime!.minute.toString())}")),
        ),
        onTap: () async {
          await commonNavigatorPushSlideHorizon(
              context, const SetGoToBedTime());
          ref.read(setAlarmTimePatternProvider.notifier).rebuildScreen();
        },
      ),
      commonCheckBoxList(
          "強制就寝設定", ref.watch(setAlarmTimePatternProvider).forceGoToBedEnable,
          onChanged: (value) async{
            await ref.read(setAlarmTimePatternProvider.notifier).setForceGoToBedEnable();
            ref.read(setAlarmTimePatternProvider.notifier).rebuildScreen();
          })
    ]);
  }

  Widget alarmListUnit(Alarm alarmValue, BuildContext context, WidgetRef ref) {
    return GestureDetector(
        child: Card(
          child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                      child: commonText16BlackLeft(
                          "${zeroAddTo2Digit(alarmValue.time.hour.toString())}:${zeroAddTo2Digit(alarmValue.time.minute.toString())}")),
                  nextDateDisplay(alarmValue.nextDateTime),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      commonShowOkNgInfoDialog(context, "削除してもよろしいですか？",
                          () async {
                        await deleteIsarAlarmById(alarmValue.id!);
                        Navigator.pop(context);
                        ref
                            .read(setAlarmTimePatternProvider.notifier)
                            .rebuildScreen();
                      });
                    },
                  )
                ],
              )),
        ),
        onTap: () async {
          await ref.read(setAlarmTimeProvider.notifier).initialize(2,
              ref.watch(setAlarmTimePatternProvider).patternId, alarmValue.id);
          await commonNavigatorPushSlideHorizon(context, const SetAlarmTime());
          ref.read(setAlarmTimePatternProvider.notifier).rebuildScreen();
        });
  }
}

Widget nextDateDisplay(DateTime? nextDateTime) {
  if (nextDateTime == null) {
    return Container();
  } else {
    return commonText16BlackLeft(
        "(next date:${zeroAddTo2Digit(nextDateTime.month.toString())}/${zeroAddTo2Digit(nextDateTime.day.toString())})");
  }
}

Widget rowOfdaysOfWeekButton(WidgetRef ref) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    daysOfWeekButton("sunday", "S", ref),
    daysOfWeekButton("monday", "M", ref),
    daysOfWeekButton("tuesday", "T", ref),
    daysOfWeekButton("wednesday", "W", ref),
    daysOfWeekButton("thursday", "T", ref),
    daysOfWeekButton("friday", "F", ref),
    daysOfWeekButton("saturday", "S", ref),
  ]);
}

Widget daysOfWeekButton(String dayName, String dayDisplay, WidgetRef ref) {
  bool repeatOnOff = ref.watch(setAlarmTimePatternProvider).getRepeats(dayName);
  Color bkColor = Colors.black;
  Color stringColor = Colors.black;
  if (repeatOnOff) {
    bkColor = commonColorSecondary;
    stringColor = Colors.white;
  } else {
    bkColor = Colors.white;
    stringColor = Colors.black87;
  }
  return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(setAlarmTimePatternProvider.notifier).setRepeats(dayName);
          },
          child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: bkColor,
                border: Border.all(color: commonColorSecondary),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    dayDisplay,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: stringColor,
                    ),
                  ))),
        ),
        const SizedBox(width: 6)
      ]);
}
