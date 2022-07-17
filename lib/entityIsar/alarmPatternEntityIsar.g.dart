// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarmPatternEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAlarmPatternCollection on Isar {
  IsarCollection<AlarmPattern> get alarmPatterns => getCollection();
}

const AlarmPatternSchema = CollectionSchema(
  name: 'AlarmPattern',
  schema:
      '{"name":"AlarmPattern","idName":"id","properties":[{"name":"friday","type":"Bool"},{"name":"monday","type":"Bool"},{"name":"patternName","type":"String"},{"name":"saturday","type":"Bool"},{"name":"sunday","type":"Bool"},{"name":"thursday","type":"Bool"},{"name":"tuesday","type":"Bool"},{"name":"wednesday","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'friday': 0,
    'monday': 1,
    'patternName': 2,
    'saturday': 3,
    'sunday': 4,
    'thursday': 5,
    'tuesday': 6,
    'wednesday': 7
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _alarmPatternGetId,
  setId: _alarmPatternSetId,
  getLinks: _alarmPatternGetLinks,
  attachLinks: _alarmPatternAttachLinks,
  serializeNative: _alarmPatternSerializeNative,
  deserializeNative: _alarmPatternDeserializeNative,
  deserializePropNative: _alarmPatternDeserializePropNative,
  serializeWeb: _alarmPatternSerializeWeb,
  deserializeWeb: _alarmPatternDeserializeWeb,
  deserializePropWeb: _alarmPatternDeserializePropWeb,
  version: 3,
);

int? _alarmPatternGetId(AlarmPattern object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _alarmPatternSetId(AlarmPattern object, int id) {
  object.id = id;
}

List<IsarLinkBase> _alarmPatternGetLinks(AlarmPattern object) {
  return [];
}

void _alarmPatternSerializeNative(
    IsarCollection<AlarmPattern> collection,
    IsarRawObject rawObj,
    AlarmPattern object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.friday;
  final _friday = value0;
  final value1 = object.monday;
  final _monday = value1;
  final value2 = object.patternName;
  final _patternName = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_patternName.length) as int;
  final value3 = object.saturday;
  final _saturday = value3;
  final value4 = object.sunday;
  final _sunday = value4;
  final value5 = object.thursday;
  final _thursday = value5;
  final value6 = object.tuesday;
  final _tuesday = value6;
  final value7 = object.wednesday;
  final _wednesday = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _friday);
  writer.writeBool(offsets[1], _monday);
  writer.writeBytes(offsets[2], _patternName);
  writer.writeBool(offsets[3], _saturday);
  writer.writeBool(offsets[4], _sunday);
  writer.writeBool(offsets[5], _thursday);
  writer.writeBool(offsets[6], _tuesday);
  writer.writeBool(offsets[7], _wednesday);
}

AlarmPattern _alarmPatternDeserializeNative(
    IsarCollection<AlarmPattern> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = AlarmPattern(
    id,
    reader.readString(offsets[2]),
    reader.readBool(offsets[1]),
    reader.readBool(offsets[6]),
    reader.readBool(offsets[7]),
    reader.readBool(offsets[5]),
    reader.readBool(offsets[0]),
    reader.readBool(offsets[3]),
    reader.readBool(offsets[4]),
  );
  return object;
}

P _alarmPatternDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _alarmPatternSerializeWeb(
    IsarCollection<AlarmPattern> collection, AlarmPattern object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'friday', object.friday);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'monday', object.monday);
  IsarNative.jsObjectSet(jsObj, 'patternName', object.patternName);
  IsarNative.jsObjectSet(jsObj, 'saturday', object.saturday);
  IsarNative.jsObjectSet(jsObj, 'sunday', object.sunday);
  IsarNative.jsObjectSet(jsObj, 'thursday', object.thursday);
  IsarNative.jsObjectSet(jsObj, 'tuesday', object.tuesday);
  IsarNative.jsObjectSet(jsObj, 'wednesday', object.wednesday);
  return jsObj;
}

AlarmPattern _alarmPatternDeserializeWeb(
    IsarCollection<AlarmPattern> collection, dynamic jsObj) {
  final object = AlarmPattern(
    IsarNative.jsObjectGet(jsObj, 'id'),
    IsarNative.jsObjectGet(jsObj, 'patternName') ?? '',
    IsarNative.jsObjectGet(jsObj, 'monday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'tuesday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'wednesday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'thursday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'friday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'saturday') ?? false,
    IsarNative.jsObjectGet(jsObj, 'sunday') ?? false,
  );
  return object;
}

P _alarmPatternDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'friday':
      return (IsarNative.jsObjectGet(jsObj, 'friday') ?? false) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'monday':
      return (IsarNative.jsObjectGet(jsObj, 'monday') ?? false) as P;
    case 'patternName':
      return (IsarNative.jsObjectGet(jsObj, 'patternName') ?? '') as P;
    case 'saturday':
      return (IsarNative.jsObjectGet(jsObj, 'saturday') ?? false) as P;
    case 'sunday':
      return (IsarNative.jsObjectGet(jsObj, 'sunday') ?? false) as P;
    case 'thursday':
      return (IsarNative.jsObjectGet(jsObj, 'thursday') ?? false) as P;
    case 'tuesday':
      return (IsarNative.jsObjectGet(jsObj, 'tuesday') ?? false) as P;
    case 'wednesday':
      return (IsarNative.jsObjectGet(jsObj, 'wednesday') ?? false) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _alarmPatternAttachLinks(
    IsarCollection col, int id, AlarmPattern object) {}

extension AlarmPatternQueryWhereSort
    on QueryBuilder<AlarmPattern, AlarmPattern, QWhere> {
  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AlarmPatternQueryWhere
    on QueryBuilder<AlarmPattern, AlarmPattern, QWhereClause> {
  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension AlarmPatternQueryFilter
    on QueryBuilder<AlarmPattern, AlarmPattern, QFilterCondition> {
  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> fridayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'friday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> mondayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'monday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'patternName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'patternName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      patternNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'patternName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      saturdayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'saturday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition> sundayEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sunday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      thursdayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'thursday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      tuesdayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tuesday',
      value: value,
    ));
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterFilterCondition>
      wednesdayEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'wednesday',
      value: value,
    ));
  }
}

extension AlarmPatternQueryLinks
    on QueryBuilder<AlarmPattern, AlarmPattern, QFilterCondition> {}

extension AlarmPatternQueryWhereSortBy
    on QueryBuilder<AlarmPattern, AlarmPattern, QSortBy> {
  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByFriday() {
    return addSortByInternal('friday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByFridayDesc() {
    return addSortByInternal('friday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByMonday() {
    return addSortByInternal('monday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByMondayDesc() {
    return addSortByInternal('monday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByPatternName() {
    return addSortByInternal('patternName', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy>
      sortByPatternNameDesc() {
    return addSortByInternal('patternName', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortBySaturday() {
    return addSortByInternal('saturday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortBySaturdayDesc() {
    return addSortByInternal('saturday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortBySunday() {
    return addSortByInternal('sunday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortBySundayDesc() {
    return addSortByInternal('sunday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByThursday() {
    return addSortByInternal('thursday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByThursdayDesc() {
    return addSortByInternal('thursday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByTuesday() {
    return addSortByInternal('tuesday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByTuesdayDesc() {
    return addSortByInternal('tuesday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByWednesday() {
    return addSortByInternal('wednesday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> sortByWednesdayDesc() {
    return addSortByInternal('wednesday', Sort.desc);
  }
}

extension AlarmPatternQueryWhereSortThenBy
    on QueryBuilder<AlarmPattern, AlarmPattern, QSortThenBy> {
  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByFriday() {
    return addSortByInternal('friday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByFridayDesc() {
    return addSortByInternal('friday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByMonday() {
    return addSortByInternal('monday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByMondayDesc() {
    return addSortByInternal('monday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByPatternName() {
    return addSortByInternal('patternName', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy>
      thenByPatternNameDesc() {
    return addSortByInternal('patternName', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenBySaturday() {
    return addSortByInternal('saturday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenBySaturdayDesc() {
    return addSortByInternal('saturday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenBySunday() {
    return addSortByInternal('sunday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenBySundayDesc() {
    return addSortByInternal('sunday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByThursday() {
    return addSortByInternal('thursday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByThursdayDesc() {
    return addSortByInternal('thursday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByTuesday() {
    return addSortByInternal('tuesday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByTuesdayDesc() {
    return addSortByInternal('tuesday', Sort.desc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByWednesday() {
    return addSortByInternal('wednesday', Sort.asc);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QAfterSortBy> thenByWednesdayDesc() {
    return addSortByInternal('wednesday', Sort.desc);
  }
}

extension AlarmPatternQueryWhereDistinct
    on QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> {
  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByFriday() {
    return addDistinctByInternal('friday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByMonday() {
    return addDistinctByInternal('monday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByPatternName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('patternName', caseSensitive: caseSensitive);
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctBySaturday() {
    return addDistinctByInternal('saturday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctBySunday() {
    return addDistinctByInternal('sunday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByThursday() {
    return addDistinctByInternal('thursday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByTuesday() {
    return addDistinctByInternal('tuesday');
  }

  QueryBuilder<AlarmPattern, AlarmPattern, QDistinct> distinctByWednesday() {
    return addDistinctByInternal('wednesday');
  }
}

extension AlarmPatternQueryProperty
    on QueryBuilder<AlarmPattern, AlarmPattern, QQueryProperty> {
  QueryBuilder<AlarmPattern, bool, QQueryOperations> fridayProperty() {
    return addPropertyNameInternal('friday');
  }

  QueryBuilder<AlarmPattern, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> mondayProperty() {
    return addPropertyNameInternal('monday');
  }

  QueryBuilder<AlarmPattern, String, QQueryOperations> patternNameProperty() {
    return addPropertyNameInternal('patternName');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> saturdayProperty() {
    return addPropertyNameInternal('saturday');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> sundayProperty() {
    return addPropertyNameInternal('sunday');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> thursdayProperty() {
    return addPropertyNameInternal('thursday');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> tuesdayProperty() {
    return addPropertyNameInternal('tuesday');
  }

  QueryBuilder<AlarmPattern, bool, QQueryOperations> wednesdayProperty() {
    return addPropertyNameInternal('wednesday');
  }
}
