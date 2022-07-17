// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarmEntityIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAlarmCollection on Isar {
  IsarCollection<Alarm> get alarms => getCollection();
}

const AlarmSchema = CollectionSchema(
  name: 'Alarm',
  schema:
      '{"name":"Alarm","idName":"id","properties":[{"name":"nextDateTime","type":"Long"},{"name":"patternId","type":"Long"},{"name":"time","type":"Long"},{"name":"valid","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'nextDateTime': 0, 'patternId': 1, 'time': 2, 'valid': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _alarmGetId,
  setId: _alarmSetId,
  getLinks: _alarmGetLinks,
  attachLinks: _alarmAttachLinks,
  serializeNative: _alarmSerializeNative,
  deserializeNative: _alarmDeserializeNative,
  deserializePropNative: _alarmDeserializePropNative,
  serializeWeb: _alarmSerializeWeb,
  deserializeWeb: _alarmDeserializeWeb,
  deserializePropWeb: _alarmDeserializePropWeb,
  version: 3,
);

int? _alarmGetId(Alarm object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _alarmSetId(Alarm object, int id) {
  object.id = id;
}

List<IsarLinkBase> _alarmGetLinks(Alarm object) {
  return [];
}

void _alarmSerializeNative(
    IsarCollection<Alarm> collection,
    IsarRawObject rawObj,
    Alarm object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.nextDateTime;
  final _nextDateTime = value0;
  final value1 = object.patternId;
  final _patternId = value1;
  final value2 = object.time;
  final _time = value2;
  final value3 = object.valid;
  final _valid = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _nextDateTime);
  writer.writeLong(offsets[1], _patternId);
  writer.writeDateTime(offsets[2], _time);
  writer.writeBool(offsets[3], _valid);
}

Alarm _alarmDeserializeNative(IsarCollection<Alarm> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Alarm(
    id,
    reader.readLong(offsets[1]),
    reader.readDateTime(offsets[2]),
    reader.readBool(offsets[3]),
    reader.readDateTimeOrNull(offsets[0]),
  );
  return object;
}

P _alarmDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _alarmSerializeWeb(IsarCollection<Alarm> collection, Alarm object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'nextDateTime',
      object.nextDateTime?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'patternId', object.patternId);
  IsarNative.jsObjectSet(
      jsObj, 'time', object.time.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'valid', object.valid);
  return jsObj;
}

Alarm _alarmDeserializeWeb(IsarCollection<Alarm> collection, dynamic jsObj) {
  final object = Alarm(
    IsarNative.jsObjectGet(jsObj, 'id'),
    IsarNative.jsObjectGet(jsObj, 'patternId') ?? double.negativeInfinity,
    IsarNative.jsObjectGet(jsObj, 'time') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'time'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    IsarNative.jsObjectGet(jsObj, 'valid') ?? false,
    IsarNative.jsObjectGet(jsObj, 'nextDateTime') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'nextDateTime'),
                isUtc: true)
            .toLocal()
        : null,
  );
  return object;
}

P _alarmDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'nextDateTime':
      return (IsarNative.jsObjectGet(jsObj, 'nextDateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'nextDateTime'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'patternId':
      return (IsarNative.jsObjectGet(jsObj, 'patternId') ??
          double.negativeInfinity) as P;
    case 'time':
      return (IsarNative.jsObjectGet(jsObj, 'time') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'time'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'valid':
      return (IsarNative.jsObjectGet(jsObj, 'valid') ?? false) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _alarmAttachLinks(IsarCollection col, int id, Alarm object) {}

extension AlarmQueryWhereSort on QueryBuilder<Alarm, Alarm, QWhere> {
  QueryBuilder<Alarm, Alarm, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AlarmQueryWhere on QueryBuilder<Alarm, Alarm, QWhereClause> {
  QueryBuilder<Alarm, Alarm, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Alarm, Alarm, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Alarm, Alarm, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Alarm, Alarm, QAfterWhereClause> idBetween(
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

extension AlarmQueryFilter on QueryBuilder<Alarm, Alarm, QFilterCondition> {
  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> nextDateTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nextDateTime',
      value: null,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> nextDateTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nextDateTime',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> nextDateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nextDateTime',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> nextDateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nextDateTime',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> nextDateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nextDateTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> patternIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'patternId',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> patternIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'patternId',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> patternIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'patternId',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> patternIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'patternId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> timeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> timeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> timeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> timeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Alarm, Alarm, QAfterFilterCondition> validEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'valid',
      value: value,
    ));
  }
}

extension AlarmQueryLinks on QueryBuilder<Alarm, Alarm, QFilterCondition> {}

extension AlarmQueryWhereSortBy on QueryBuilder<Alarm, Alarm, QSortBy> {
  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByNextDateTime() {
    return addSortByInternal('nextDateTime', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByNextDateTimeDesc() {
    return addSortByInternal('nextDateTime', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByPatternId() {
    return addSortByInternal('patternId', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByPatternIdDesc() {
    return addSortByInternal('patternId', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByValid() {
    return addSortByInternal('valid', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> sortByValidDesc() {
    return addSortByInternal('valid', Sort.desc);
  }
}

extension AlarmQueryWhereSortThenBy on QueryBuilder<Alarm, Alarm, QSortThenBy> {
  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByNextDateTime() {
    return addSortByInternal('nextDateTime', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByNextDateTimeDesc() {
    return addSortByInternal('nextDateTime', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByPatternId() {
    return addSortByInternal('patternId', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByPatternIdDesc() {
    return addSortByInternal('patternId', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByValid() {
    return addSortByInternal('valid', Sort.asc);
  }

  QueryBuilder<Alarm, Alarm, QAfterSortBy> thenByValidDesc() {
    return addSortByInternal('valid', Sort.desc);
  }
}

extension AlarmQueryWhereDistinct on QueryBuilder<Alarm, Alarm, QDistinct> {
  QueryBuilder<Alarm, Alarm, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Alarm, Alarm, QDistinct> distinctByNextDateTime() {
    return addDistinctByInternal('nextDateTime');
  }

  QueryBuilder<Alarm, Alarm, QDistinct> distinctByPatternId() {
    return addDistinctByInternal('patternId');
  }

  QueryBuilder<Alarm, Alarm, QDistinct> distinctByTime() {
    return addDistinctByInternal('time');
  }

  QueryBuilder<Alarm, Alarm, QDistinct> distinctByValid() {
    return addDistinctByInternal('valid');
  }
}

extension AlarmQueryProperty on QueryBuilder<Alarm, Alarm, QQueryProperty> {
  QueryBuilder<Alarm, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Alarm, DateTime?, QQueryOperations> nextDateTimeProperty() {
    return addPropertyNameInternal('nextDateTime');
  }

  QueryBuilder<Alarm, int, QQueryOperations> patternIdProperty() {
    return addPropertyNameInternal('patternId');
  }

  QueryBuilder<Alarm, DateTime, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<Alarm, bool, QQueryOperations> validProperty() {
    return addPropertyNameInternal('valid');
  }
}
