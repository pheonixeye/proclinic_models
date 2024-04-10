// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/utils/object_id.dart';

class Affiliate extends Equatable {
  final ObjectId id;
  final String affiliateEn;
  final String affiliateAr;

  const Affiliate({
    required this.id,
    required this.affiliateEn,
    required this.affiliateAr,
  });

  Affiliate copyWith({
    ObjectId? id,
    String? affiliateEn,
    String? affiliateAr,
  }) {
    return Affiliate(
      id: id ?? this.id,
      affiliateEn: affiliateEn ?? this.affiliateEn,
      affiliateAr: affiliateAr ?? this.affiliateAr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'affiliateEn': affiliateEn,
      'affiliateAr': affiliateAr,
    };
  }

  factory Affiliate.fromJson(Map<String, dynamic> map) {
    return Affiliate(
      id: (map['id'] as ObjectId),
      affiliateEn: map['affiliateEn'] as String,
      affiliateAr: map['affiliateAr'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, affiliateEn, affiliateAr];
}
