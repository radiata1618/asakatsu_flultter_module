import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addNewAlarmPatternTimeProvider = ChangeNotifierProvider(
      (ref) => AddNewAlarmPatternTimeProvider(),
);

class AddNewAlarmPatternTimeProvider extends ChangeNotifier {
  String _patternName = "";
  // String _roomName = "";
  // DateTime? _endDateTime;
  //
  String get patternName => _patternName;
  // String get roomName => _roomName;
  // DateTime? get endDateTime => _endDateTime;

  void setName(String name){
    _patternName = name;
  }

  void initialize() {
    _patternName="";
  }
}