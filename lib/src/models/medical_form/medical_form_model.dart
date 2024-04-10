// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class MedicalForm extends Equatable {
  //TODO: rewrite with implementation
  final ObjectId id;
  final String specialityEn;
  final String specialityAr;
  final List<TitleSheetItem> mainTitles;

  const MedicalForm({
    required this.id,
    required this.specialityEn,
    required this.specialityAr,
    required this.mainTitles,
  });

  MedicalForm copyWith({
    ObjectId? id,
    String? specialityEn,
    String? specialityAr,
    List<TitleSheetItem>? mainTitles,
  }) {
    return MedicalForm(
      id: id ?? this.id,
      specialityEn: specialityEn ?? this.specialityEn,
      specialityAr: specialityAr ?? this.specialityAr,
      mainTitles: mainTitles ?? this.mainTitles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'specialityEn': specialityEn,
      'specialityAr': specialityAr,
      'mainTitles': mainTitles.map((x) => x.toMap()).toList(),
    };
  }

  factory MedicalForm.fromMap(Map<String, dynamic> map) {
    return MedicalForm(
      id: map['_id'] as ObjectId,
      specialityEn: map['specialityEn'] as String,
      specialityAr: map['specialityAr'] as String,
      mainTitles: List<TitleSheetItem>.from(
        (map['mainTitles'] as List<int>).map<TitleSheetItem>(
          (x) => TitleSheetItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalForm.fromJson(String source) =>
      MedicalForm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, specialityEn, specialityAr, mainTitles];
}

class TitleSheetItem extends Equatable {
  final ObjectId id;
  final String title;
  final List<SubtitleSheetItem> subtitles;

  const TitleSheetItem({
    required this.id,
    required this.title,
    required this.subtitles,
  });

  TitleSheetItem copyWith({
    ObjectId? id,
    String? title,
    List<SubtitleSheetItem>? subtitles,
  }) {
    return TitleSheetItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitles: subtitles ?? this.subtitles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'subtitles': subtitles.map((x) => x.toMap()).toList(),
    };
  }

  factory TitleSheetItem.fromMap(Map<String, dynamic> map) {
    return TitleSheetItem(
      id: map['_id'] as ObjectId,
      title: map['title'] as String,
      subtitles: List<SubtitleSheetItem>.from(
        (map['subtitles'] as List<int>).map<SubtitleSheetItem>(
          (x) => SubtitleSheetItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TitleSheetItem.fromJson(String source) =>
      TitleSheetItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, subtitles];
}

class SubtitleSheetItem extends Equatable {
  final ObjectId id;
  final String title;
  final String defaultValue;
  final String type;
  final String dataType;
  final List<String> options;
  final bool isRequired;

  const SubtitleSheetItem({
    required this.id,
    required this.title,
    required this.defaultValue,
    required this.type,
    required this.dataType,
    required this.options,
    required this.isRequired,
  });

  SubtitleSheetItem copyWith({
    ObjectId? id,
    String? title,
    String? defaultValue,
    String? type,
    String? dataType,
    List<String>? options,
    bool? isRequired,
  }) {
    return SubtitleSheetItem(
      id: id ?? this.id,
      title: title ?? this.title,
      defaultValue: defaultValue ?? this.defaultValue,
      type: type ?? this.type,
      dataType: dataType ?? this.dataType,
      options: options ?? this.options,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'defaultValue': defaultValue,
      'type': type,
      'dataType': dataType,
      'options': options,
      'isRequired': isRequired,
    };
  }

  factory SubtitleSheetItem.fromMap(Map<String, dynamic> map) {
    return SubtitleSheetItem(
      id: map['_id'] as ObjectId,
      title: map['title'] as String,
      defaultValue: map['defaultValue'] as String,
      type: map['type'] as String,
      dataType: map['dataType'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      isRequired: map['isRequired'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubtitleSheetItem.fromJson(String source) =>
      SubtitleSheetItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubtitleSheetItem(id: $id, title: $title, defaultValue: $defaultValue, type: $type, dataType: $dataType, options: $options, isRequired: $isRequired)';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        defaultValue,
        type,
        dataType,
        options,
        isRequired,
      ];
}
