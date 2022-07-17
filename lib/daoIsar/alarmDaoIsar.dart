import 'package:isar/isar.dart';
import '../entityIsar/alarmEntityIsar.dart';
import 'commonIsar.dart';

Future<Alarm?> selectIsarAlarm(int id) async {

  var isarInstance = Isar.getInstance();
  Alarm? resultAlarmPattern;
  await isarInstance?.writeTxn((isar) async {
    List<Alarm> resultList = await isar.alarms.filter().idEqualTo(id).findAll();

    if(resultList.isEmpty){
      resultAlarmPattern = null;
    }else{
      resultAlarmPattern = resultList[0];
    }
  });
  return resultAlarmPattern;
}



Future<Alarm?> selectIsarAlarmMostRecent() async {

  await openIsarInstances();
  var isarInstance = Isar.getInstance();
  List<Alarm?> resultReturnList=[];
  await isarInstance?.writeTxn((isar) async {
    resultReturnList = await isar.alarms.where().sortByNextDateTime().findAll();
  });


  if(resultReturnList.length==0){
    return null;
  }
  for(int i= 0;i<resultReturnList.length;i++){
    if(resultReturnList[i]!.nextDateTime!=null){
      return resultReturnList[i]!;
    }
  }

  return null;
}


Future<List<Alarm>> selectIsarAlarmByPatternId(int patternId) async {

  var isarInstance = Isar.getInstance();
  List<Alarm> resultListReturn=[];
  await isarInstance?.writeTxn((isar) async {
    List<Alarm> resultList = await isar.alarms.filter().patternIdEqualTo(patternId).sortByTime().findAll();

    resultListReturn=resultList;
  });
  return resultListReturn;
}


Future<int> insertIsarAlarm({
  required int patternId,
  required DateTime time,
  required bool valid,
  required DateTime? nextDateTime
}) async {

  Alarm insertAlarm= Alarm(
    null,
    patternId,
    time,
    valid,
    nextDateTime
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.alarms.put(insertAlarm);
  });

  return returnResult;

}


Future<int> updateIsarAlarm({
  required int id,
  required int patternId,
  required DateTime time,
  required bool valid,
  required DateTime? nextDateTime
}) async {

  Alarm updateAlarm= Alarm(
    id,
    patternId,
    time,
    valid,
    nextDateTime
  );

  var isarInstance = Isar.getInstance();
  int returnResult=0;

  await isarInstance?.writeTxn((isar) async {
    returnResult=  await isar.alarms.put(updateAlarm);
  });

  return returnResult;

}

Future<int> deleteIsarAlarmByPatternId(int patternId) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.alarms.filter().patternIdEqualTo(patternId).deleteAll();
  });

  return returnInt;

}


Future<int> deleteIsarAlarmById(int id) async {

  int returnInt=0;
  var isarInstance = Isar.getInstance();
  await isarInstance?.writeTxn((isar) async {
    returnInt = await isar.alarms.filter().idEqualTo(id).deleteAll();
  });

  return returnInt;

}