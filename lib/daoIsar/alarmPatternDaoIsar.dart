import 'package:isar/isar.dart';
import '../entityIsar/alarmPatternEntityIsar.dart';
import 'commonIsar.dart';

Future<AlarmPattern?> selectIsarAlarmPattern(int id) async {

  var isarInstance = Isar.getInstance();
  AlarmPattern? resultAlarmPattern;
  await isarInstance?.writeTxn((isar) async {
    List<AlarmPattern> resultList = await isar.alarmPatterns.filter().idEqualTo(id).findAll();

    if(resultList.isEmpty){
      resultAlarmPattern = null;
    }else{
      resultAlarmPattern = resultList[0];
    }
  });
  return resultAlarmPattern;
}


Future<List<AlarmPattern>> selectIsarAllAlarmPattern() async {

  await openIsarInstances();
  var isarInstance = Isar.getInstance();
  List<AlarmPattern> resultListReturn=[];
  await isarInstance?.writeTxn((isar) async {
    List<AlarmPattern> resultList = await isar.alarmPatterns.where().findAll();

    resultListReturn=resultList;
  });
  return resultListReturn;
}

Future<int> insertIsarAlarmPattern({
  required String patternName,
  required bool monday,
  required bool tuesday,
  required bool wednesday,
  required bool thursday,
  required bool friday,
  required bool saturday,
  required bool sunday
}) async {

  AlarmPattern insertAlarmPattern= AlarmPattern(
    null,
    patternName,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.alarmPatterns.put(insertAlarmPattern);
  });

  return returnResult;

}


Future<int> updateIsarAlarmPattern({
  required int id,
  required String patternName,
  required bool monday,
  required bool tuesday,
  required bool wednesday,
  required bool thursday,
  required bool friday,
  required bool saturday,
  required bool sunday
}) async {

  AlarmPattern updateAlarmPattern= AlarmPattern(
    id,
    patternName,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.alarmPatterns.put(updateAlarmPattern);
  });

  return returnResult;

}

Future<int> deleteIsarAlarmPattern(int id) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.alarmPatterns.filter().idEqualTo(id).deleteAll();
  });

  return returnInt;

}

Future<int> updateIsarAlarmPatternDayOfWeek({
  required AlarmPattern alarmPattern,
  required String dayName
}) async {
  bool tmpMonday=alarmPattern.monday;
  bool tmpTueday=alarmPattern.tuesday;
  bool tmpWednesday=alarmPattern.wednesday;
  bool tmpThursday=alarmPattern.thursday;
  bool tmpFriday=alarmPattern.friday;
  bool tmpSaturday=alarmPattern.saturday;
  bool tmpSunday=alarmPattern.sunday;

  switch(dayName){
    case "monday":
      tmpMonday =  !tmpMonday;
      break;
    case "tuesday":
      tmpTueday =  !tmpTueday;
      break;
    case "wednesday":
      tmpWednesday =  !tmpWednesday;
      break;
    case "thursday":
      tmpThursday =  !tmpThursday;
      break;
    case "friday":
      tmpFriday =  !tmpFriday;
      break;
    case "saturday":
      tmpSaturday =  !tmpSaturday;
      break;
    case "sunday":
      tmpSunday =  !tmpSunday;
      break;
  }

  return await updateIsarAlarmPattern(
      id: alarmPattern.id!,
      patternName: alarmPattern.patternName!,
      monday: tmpMonday,
      tuesday: tmpTueday,
      wednesday: tmpWednesday,
      thursday: tmpThursday,
      friday: tmpFriday,
      saturday: tmpSaturday,
      sunday: tmpSunday);

}