import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/utils/object_id.dart';

class Speciality extends Equatable {
  final ObjectId id;
  final String nameEn;
  final String nameAr;

  const Speciality({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  Speciality copyWith({
    ObjectId? id,
    String? nameEn,
    String? nameAr,
  }) {
    return Speciality(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
    };
  }

  factory Speciality.fromJson(Map<String, dynamic> map) {
    return Speciality(
      id: (map['_id'] as ObjectId),
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, nameEn, nameAr];

  factory Speciality.create({
    required String nameEn,
    required String nameAr,
  }) {
    return Speciality(
      id: ObjectId(),
      nameEn: nameEn,
      nameAr: nameAr,
    );
  }
}
