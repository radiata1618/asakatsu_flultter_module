import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/logic/commonLogicAlarm.dart';
import '../daoIsar/alarmPatternDaoIsar.dart';
import '../entityIsar/alarmPatternEntityIsar.dart';

final setAlarmTimePatternProvider = ChangeNotifierProvider(
      (ref) => SetAlarmTimePatternProvider(),
);

class SetAlarmTimePatternProvider extends ChangeNotifier {

  int _patternId=-1;
  String _patternName="";
  bool _monday=false;
  bool _tuesday=false;
  bool _wednesday=false;
  bool _thursday=false;
  bool _friday=false;
  bool _saturday=false;
  bool _sunday=false;
  int _dummyVariableForRebuild=0;
  DateTime? _goToBedTime;
  bool _forceGoToBedEnable=false;

  int get patternId=>_patternId;
  String get patternName=>_patternName;
  bool get monday=>_monday;
  bool get tuesday=>_tuesday;
  bool get wednesday=>_wednesday;
  bool get thursday=>_thursday;
  bool get friday=>_friday;
  bool get saturday=>_saturday;
  bool get sunday=>_sunday;
  int get dummyVariableForRebuild=>_dummyVariableForRebuild;
  DateTime? get goToBedTime=>_goToBedTime;
  bool get forceGoToBedEnable=>_forceGoToBedEnable;


  setPatternName(String nameValue){
    _patternName=nameValue;
  }


  setGoToBedTime(DateTime? value){
    _goToBedTime=value;
  }

  Future<void> initialize(int patternIdValue)async {
    _patternId=patternIdValue;
    AlarmPattern? alarmPattern=await selectIsarAlarmPattern(_patternId);
    _patternName=alarmPattern!.patternName;
    _monday=alarmPattern!.monday;
    _tuesday=alarmPattern!.tuesday;
    _wednesday=alarmPattern!.wednesday;
    _thursday=alarmPattern!.thursday;
    _friday=alarmPattern!.friday;
    _saturday=alarmPattern!.saturday;
    _sunday=alarmPattern!.sunday;
    _goToBedTime=alarmPattern!.goToBedTime;


  }

  Future<void> setRepeats(String key)async {
    switch(key){
      case "monday":
        _monday=!_monday;
        break;
      case "tuesday":
        _tuesday=!_tuesday;
        break;
      case "wednesday":
        _wednesday=!_wednesday;
        break;
      case "thursday":
        _thursday=!_thursday;
        break;
      case "friday":
        _friday=!_friday;
        break;
      case "saturday":
        _saturday=!_saturday;
        break;
      case "sunday":
        _sunday=!_sunday;
        break;
    }
    await updateIsarAlarmPatternCall();
  }

  Future<void> setForceGoToBedEnable()async {
    _forceGoToBedEnable=!_forceGoToBedEnable;
    await updateIsarAlarmPatternCall();
  }

  Future<void> updateIsarAlarmPatternCall()async {
    await updateIsarAlarmPattern(patternName: _patternName, monday: _monday, tuesday: _tuesday, wednesday: _wednesday, thursday: _thursday, friday: _friday, saturday: _saturday, sunday: _sunday, id: _patternId,goToBedTime: _goToBedTime,forceGoToBedEnable:_forceGoToBedEnable);
    await refleshAlarmNextDateTimeByPatternId(_patternId);
    notifyListeners();
  }

  getRepeats(String key){
    switch(key){
      case "monday":
        return _monday;
      case "tuesday":
        return _tuesday;
      case "wednesday":
        return _wednesday;
      case "thursday":
        return _thursday;
      case "friday":
        return _friday;
      case "saturday":
        return _saturday;
      case "sunday":
        return _sunday;
    }
  }

  void rebuildScreen(){
    _dummyVariableForRebuild=_dummyVariableForRebuild+1;
    notifyListeners();
  }

}