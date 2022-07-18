import '../../daoIsar/alarmDaoIsar.dart';
import '../../daoIsar/alarmPatternDaoIsar.dart';
import '../../entityIsar/alarmEntityIsar.dart';
import '../../entityIsar/alarmPatternEntityIsar.dart';
import '../commonValues.dart';

Future<void> refleshAlarmNextDateTimeByPatternId(int patternId)async{
  AlarmPattern? alarmPattern=await selectIsarAlarmPattern(patternId);
  List<Alarm> alarmList = await selectIsarAlarmByPatternId(patternId);

  for(int i=0;i<alarmList.length;i++){
    await updateIsarAlarm(id: alarmList[i].id!, patternId: alarmList[i].patternId, time: alarmList[i].time, valid: alarmList[i].valid, nextDateTime: calcAlarmNextDateTimeUnit(alarmList[i].time, alarmPattern!));
  }

}

DateTime? calcAlarmNextDateTimeUnit(DateTime alarmDateTime, AlarmPattern alarmPattern) {

  if(!alarmPattern.monday&&
      !alarmPattern.tuesday&&
      !alarmPattern.wednesday&&
      !alarmPattern.thursday&&
      !alarmPattern.friday&&
      !alarmPattern.saturday&&
      !alarmPattern.sunday
  ){
    return null;
  }else{

    DateTime provisionalDateTime = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,alarmDateTime.hour,alarmDateTime.minute);

    if(provisionalDateTime.isBefore(DateTime.now())){
      provisionalDateTime=provisionalDateTime.add(const Duration(days: 1));
    }

    while(!judgeDayOfWeekOnOff(provisionalDateTime,alarmPattern)){
      provisionalDateTime=provisionalDateTime.add(const Duration(days: 1));
    }

    return provisionalDateTime;
  }
}

bool judgeDayOfWeekOnOff(DateTime dateTime, AlarmPattern alarmPattern){

  switch(dateTime.weekday){
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

void setAlarmTimerKotlin(){

  String response = platformForCallKotlin.invokeMethod('selectUsersByConditionsOnKotlin',conditionsList);
}
