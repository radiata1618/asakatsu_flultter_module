import '../../daoIsar/alarmDaoIsar.dart';
import '../../daoIsar/alarmPatternDaoIsar.dart';
import '../../entityIsar/alarmEntityIsar.dart';
import '../../entityIsar/alarmPatternEntityIsar.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'commonLogicOthers.dart';

Future<void> refleshAlarmNextDateTimeByPatternId(int patternId) async {
  AlarmPattern? alarmPattern = await selectIsarAlarmPattern(patternId);
  List<Alarm> alarmList = await selectIsarAlarmByPatternId(patternId);

  for (int i = 0; i < alarmList.length; i++) {
    await updateIsarAlarm(
        id: alarmList[i].id!,
        patternId: alarmList[i].patternId,
        time: alarmList[i].time,
        valid: alarmList[i].valid,
        nextDateTime:
            calcAlarmNextDateTimeUnit(alarmList[i].time, alarmPattern!));
  }

  await calcAndWriteNextTimeOnTextFile();
}

DateTime? calcAlarmNextDateTimeUnit(
    DateTime alarmDateTime, AlarmPattern alarmPattern) {
  if (!alarmPattern.monday &&
      !alarmPattern.tuesday &&
      !alarmPattern.wednesday &&
      !alarmPattern.thursday &&
      !alarmPattern.friday &&
      !alarmPattern.saturday &&
      !alarmPattern.sunday) {
    return null;
  } else {
    DateTime provisionalDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        alarmDateTime.hour,
        alarmDateTime.minute);

    if (provisionalDateTime.isBefore(DateTime.now())) {
      provisionalDateTime = provisionalDateTime.add(const Duration(days: 1));
    }

    while (!judgeDayOfWeekOnOff(provisionalDateTime, alarmPattern)) {
      provisionalDateTime = provisionalDateTime.add(const Duration(days: 1));
    }

    return provisionalDateTime;
  }
}

bool judgeDayOfWeekOnOff(DateTime dateTime, AlarmPattern alarmPattern) {
  switch (dateTime.weekday) {
    case 1:
      return alarmPattern.monday;
    case 2:
      return alarmPattern.tuesday;
    case 3:
      return alarmPattern.wednesday;
    case 4:
      return alarmPattern.thursday;
    case 5:
      return alarmPattern.friday;
    case 6:
      return alarmPattern.saturday;
    default:
      return alarmPattern.sunday;
  }
}

Future<void> calcAndWriteNextTimeOnTextFile() async {
  Alarm? nextAlarm = await selectIsarAlarmMostRecent();

  String text = "";
  if(nextAlarm==null){
  }else{
    if (nextAlarm!.nextDateTime == null) {
    } else {
      text = nextAlarm!.nextDateTime!.year.toString() +
          zeroAddTo2Digit(nextAlarm!.nextDateTime!.month.toString()) +
          zeroAddTo2Digit(nextAlarm!.nextDateTime!.day.toString())+
          zeroAddTo2Digit(nextAlarm!.nextDateTime!.hour.toString())+
          zeroAddTo2Digit(nextAlarm!.nextDateTime!.minute.toString());
    }
  }

  getFilePath().then((File file) {
    file.writeAsString(text);
  });
}

//テキストファイルを保存するパスを取得する
Future<File> getFilePath() async {
  final directory = await getTemporaryDirectory();
  return File('${directory.path}/nextTimeInfo.txt');
}
