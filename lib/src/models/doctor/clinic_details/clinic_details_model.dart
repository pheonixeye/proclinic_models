// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/utils/object_id.dart';

class ClinicDetails extends Equatable {
  final ObjectId id;
  final String detailEn;
  final String detailAr;

  const ClinicDetails({
    required this.id,
    required this.detailEn,
    required this.detailAr,
  });

  ClinicDetails copyWith({
    ObjectId? id,
    String? detailEn,
    String? detailAr,
  }) {
    return ClinicDetails(
      id: id ?? this.id,
      detailEn: detailEn ?? this.detailEn,
      detailAr: detailAr ?? this.detailAr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'detailEn': detailEn,
      'detailAr': detailAr,
    };
  }

  factory ClinicDetails.fromJson(Map<String, dynamic> map) {
    return ClinicDetails(
      id: (map['_id'] as ObjectId),
      detailEn: map['detailEn'] as String,
      detailAr: map['detailAr'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, detailEn, detailAr];
}
