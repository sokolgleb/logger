import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'measurement_indicator_types_record.g.dart';

abstract class MeasurementIndicatorTypesRecord
    implements
        Built<MeasurementIndicatorTypesRecord,
            MeasurementIndicatorTypesRecordBuilder> {
  static Serializer<MeasurementIndicatorTypesRecord> get serializer =>
      _$measurementIndicatorTypesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get value;

  @nullable
  bool get active;

  @nullable
  int get order;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(
          MeasurementIndicatorTypesRecordBuilder builder) =>
      builder
        ..name = ''
        ..value = ''
        ..active = false
        ..order = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('measurementIndicatorTypes');

  static Stream<MeasurementIndicatorTypesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MeasurementIndicatorTypesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MeasurementIndicatorTypesRecord._();
  factory MeasurementIndicatorTypesRecord(
          [void Function(MeasurementIndicatorTypesRecordBuilder) updates]) =
      _$MeasurementIndicatorTypesRecord;

  static MeasurementIndicatorTypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMeasurementIndicatorTypesRecordData({
  String name,
  String value,
  bool active,
  int order,
}) =>
    serializers.toFirestore(
        MeasurementIndicatorTypesRecord.serializer,
        MeasurementIndicatorTypesRecord((m) => m
          ..name = name
          ..value = value
          ..active = active
          ..order = order));
