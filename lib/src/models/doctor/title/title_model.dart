// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/utils/object_id.dart';

class Title extends Equatable {
  final ObjectId id;
  final String titleEn;
  final String titleAr;

  const Title({
    required this.id,
    required this.titleEn,
    required this.titleAr,
  });

  Title copyWith({
    ObjectId? id,
    String? titleEn,
    String? titleAr,
  }) {
    return Title(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
    };
  }

  factory Title.fromJson(Map<String, dynamic> map) {
    return Title(
      id: (map['_id'] as ObjectId),
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, titleEn, titleAr];
}
