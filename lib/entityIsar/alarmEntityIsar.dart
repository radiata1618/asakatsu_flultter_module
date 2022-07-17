import 'package:isar/isar.dart';

part 'alarmEntityIsar.g.dart';

//flutter pub run build_runner build
@Collection()
class Alarm {
  Alarm(
      this.id,
      this.patternId,
      this.time,
      this.valid,
      this.nextDateTime
      );

  @Id()
  int? id;
  int patternId;
  DateTime time;
  bool valid;
  DateTime? nextDateTime;
}