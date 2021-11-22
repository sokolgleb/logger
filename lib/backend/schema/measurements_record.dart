import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'measurements_record.g.dart';

abstract class MeasurementsRecord
    implements Built<MeasurementsRecord, MeasurementsRecordBuilder> {
  static Serializer<MeasurementsRecord> get serializer =>
      _$measurementsRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get desc;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  String get status;

  @nullable
  bool get isFavorite;

  @nullable
  BuiltList<DocumentReference> get groups;

  @nullable
  String get image;

  @nullable
  DateTime get createdAt;

  @nullable
  DateTime get updatedAt;

  @nullable
  LatLng get geoLocation;

  @nullable
  String get indicatorDefaultStringValue;

  @nullable
  bool get indicatorDefaultBooleanValue;

  @nullable
  bool get usePreviousValue;

  @nullable
  bool get isCalculated;

  @nullable
  String get indicatorType;

  @nullable
  double get indicatorDefaultNumberValue;

  @nullable
  int get valuesCount;

  @nullable
  double get indicatorDefaultSliderValue;

  @nullable
  int get indicatorDefaultRatingValue;

  @nullable
  int get indicatorDefaultTimeValue;

  @nullable
  BuiltList<String> get images;

  @nullable
  DocumentReference get owner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MeasurementsRecordBuilder builder) => builder
    ..title = ''
    ..desc = ''
    ..users = ListBuilder()
    ..status = ''
    ..isFavorite = false
    ..groups = ListBuilder()
    ..image = ''
    ..indicatorDefaultStringValue = ''
    ..indicatorDefaultBooleanValue = false
    ..usePreviousValue = false
    ..isCalculated = false
    ..indicatorType = ''
    ..indicatorDefaultNumberValue = 0.0
    ..valuesCount = 0
    ..indicatorDefaultSliderValue = 0.0
    ..indicatorDefaultRatingValue = 0
    ..indicatorDefaultTimeValue = 0
    ..images = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('measurements');

  static Stream<MeasurementsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeasurementsRecord._();
  factory MeasurementsRecord(
          [void Function(MeasurementsRecordBuilder) updates]) =
      _$MeasurementsRecord;

  static MeasurementsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeasurementsRecordData({
  String title,
  String desc,
  String status,
  bool isFavorite,
  String image,
  DateTime createdAt,
  DateTime updatedAt,
  LatLng geoLocation,
  String indicatorDefaultStringValue,
  bool indicatorDefaultBooleanValue,
  bool usePreviousValue,
  bool isCalculated,
  String indicatorType,
  double indicatorDefaultNumberValue,
  int valuesCount,
  double indicatorDefaultSliderValue,
  int indicatorDefaultRatingValue,
  int indicatorDefaultTimeValue,
  DocumentReference owner,
}) =>
    serializers.toFirestore(
        MeasurementsRecord.serializer,
        MeasurementsRecord((m) => m
          ..title = title
          ..desc = desc
          ..users = null
          ..status = status
          ..isFavorite = isFavorite
          ..groups = null
          ..image = image
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..geoLocation = geoLocation
          ..indicatorDefaultStringValue = indicatorDefaultStringValue
          ..indicatorDefaultBooleanValue = indicatorDefaultBooleanValue
          ..usePreviousValue = usePreviousValue
          ..isCalculated = isCalculated
          ..indicatorType = indicatorType
          ..indicatorDefaultNumberValue = indicatorDefaultNumberValue
          ..valuesCount = valuesCount
          ..indicatorDefaultSliderValue = indicatorDefaultSliderValue
          ..indicatorDefaultRatingValue = indicatorDefaultRatingValue
          ..indicatorDefaultTimeValue = indicatorDefaultTimeValue
          ..images = null
          ..owner = owner));
