import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'groups_record.g.dart';

abstract class GroupsRecord
    implements Built<GroupsRecord, GroupsRecordBuilder> {
  static Serializer<GroupsRecord> get serializer => _$groupsRecordSerializer;

  @nullable
  String get title;

  @nullable
  DocumentReference get user;

  @nullable
  DateTime get createdAt;

  @nullable
  DateTime get updatedAt;

  @nullable
  String get color;

  @nullable
  String get status;

  @nullable
  String get image;

  @nullable
  int get order;

  @nullable
  DocumentReference get parentGroup;

  @nullable
  bool get hasParentGroup;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GroupsRecordBuilder builder) => builder
    ..title = ''
    ..color = ''
    ..status = ''
    ..image = ''
    ..order = 0
    ..hasParentGroup = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GroupsRecord._();
  factory GroupsRecord([void Function(GroupsRecordBuilder) updates]) =
      _$GroupsRecord;

  static GroupsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGroupsRecordData({
  String title,
  DocumentReference user,
  DateTime createdAt,
  DateTime updatedAt,
  String color,
  String status,
  String image,
  int order,
  DocumentReference parentGroup,
  bool hasParentGroup,
}) =>
    serializers.toFirestore(
        GroupsRecord.serializer,
        GroupsRecord((g) => g
          ..title = title
          ..user = user
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..color = color
          ..status = status
          ..image = image
          ..order = order
          ..parentGroup = parentGroup
          ..hasParentGroup = hasParentGroup));
