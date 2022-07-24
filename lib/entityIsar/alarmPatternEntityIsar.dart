import 'package:isar/isar.dart';

part 'alarmPatternEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class AlarmPattern {

  AlarmPattern(
      this.id,
      this.patternName,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday,
      this.goToBedTime,
      this.forceGoToBedEnable
      );

  @Id()
  int? id;
  String patternName;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;
  DateTime? goToBedTime;
  bool forceGoToBedEnable;

}