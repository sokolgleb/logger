import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'measurement_indicator_values_record.g.dart';

abstract class MeasurementIndicatorValuesRecord
    implements
        Built<MeasurementIndicatorValuesRecord,
            MeasurementIndicatorValuesRecordBuilder> {
  static Serializer<MeasurementIndicatorValuesRecord> get serializer =>
      _$measurementIndicatorValuesRecordSerializer;

  @nullable
  DateTime get timestamp;

  @nullable
  String get type;

  @nullable
  String get imageValue;

  @nullable
  String get videoValue;

  @nullable
  String get audioValue;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get group;

  @nullable
  DocumentReference get measurement;

  @nullable
  String get textValue;

  @nullable
  double get numberValue;

  @nullable
  bool get switchValue;

  @nullable
  DateTime get createdAt;

  @nullable
  DateTime get updatedAt;

  @nullable
  int get ratingValue;

  @nullable
  double get sliderValue;

  @nullable
  int get timeValue;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(
          MeasurementIndicatorValuesRecordBuilder builder) =>
      builder
        ..type = ''
        ..imageValue = ''
        ..videoValue = ''
        ..audioValue = ''
        ..textValue = ''
        ..numberValue = 0.0
        ..switchValue = false
        ..ratingValue = 0
        ..sliderValue = 0.0
        ..timeValue = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('measurementIndicatorValues');

  static Stream<MeasurementIndicatorValuesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MeasurementIndicatorValuesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeasurementIndicatorValuesRecord._();
  factory MeasurementIndicatorValuesRecord(
          [void Function(MeasurementIndicatorValuesRecordBuilder) updates]) =
      _$MeasurementIndicatorValuesRecord;

  static MeasurementIndicatorValuesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeasurementIndicatorValuesRecordData({
  DateTime timestamp,
  String type,
  String imageValue,
  String videoValue,
  String audioValue,
  DocumentReference user,
  DocumentReference group,
  DocumentReference measurement,
  String textValue,
  double numberValue,
  bool switchValue,
  DateTime createdAt,
  DateTime updatedAt,
  int ratingValue,
  double sliderValue,
  int timeValue,
}) =>
    serializers.toFirestore(
        MeasurementIndicatorValuesRecord.serializer,
        MeasurementIndicatorValuesRecord((m) => m
          ..timestamp = timestamp
          ..type = type
          ..imageValue = imageValue
          ..videoValue = videoValue
          ..audioValue = audioValue
          ..user = user
          ..group = group
          ..measurement = measurement
          ..textValue = textValue
          ..numberValue = numberValue
          ..switchValue = switchValue
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..ratingValue = ratingValue
          ..sliderValue = sliderValue
          ..timeValue = timeValue));
