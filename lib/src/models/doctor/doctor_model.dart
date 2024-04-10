// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names, file_names

import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/models/doctor/affiliate/affiliate_model.dart';
import 'package:proclinic_models/src/models/doctor/clinic_details/clinic_details_model.dart';
import 'package:proclinic_models/src/models/doctor/procedure/procedure_model.dart';
import 'package:proclinic_models/src/models/doctor/title/title_model.dart';

class Doctor extends Equatable {
  final int id;
  final String docnameEN;
  final String docnameAR;
  final String clinicEN;
  final String clinicAR;
  final String phonePER;
  final String phoneASS;
  final String? password;
  final String? avatar;
  final bool grid;
  final List<Procedure> procedures;
  final List<Title> titles;
  final List<Affiliate> affiliates;
  final List<ClinicDetails> clinicDetails;
  final List<String> labs;
  final List<String> rads;
  final List<String> drugs;
  final bool published;
  final List<String> fields;

  const Doctor({
    required this.id,
    required this.docnameEN,
    required this.docnameAR,
    required this.clinicEN,
    required this.clinicAR,
    required this.phonePER,
    required this.phoneASS,
    this.password,
    this.avatar,
    required this.grid,
    required this.procedures,
    required this.titles,
    required this.affiliates,
    required this.clinicDetails,
    required this.labs,
    required this.rads,
    required this.drugs,
    required this.published,
    required this.fields,
  });

  Doctor copyWith({
    int? id,
    String? docnameEN,
    String? docnameAR,
    String? clinicEN,
    String? clinicAR,
    String? phonePER,
    String? phoneASS,
    String? password,
    String? avatar,
    bool? grid,
    List<Procedure>? procedures,
    List<Title>? titles,
    List<Affiliate>? affiliates,
    List<ClinicDetails>? clinicDetails,
    List<String>? labs,
    List<String>? rads,
    List<String>? drugs,
    bool? published,
    List<String>? fields,
  }) {
    return Doctor(
      id: id ?? this.id,
      docnameEN: docnameEN ?? this.docnameEN,
      docnameAR: docnameAR ?? this.docnameAR,
      clinicEN: clinicEN ?? this.clinicEN,
      clinicAR: clinicAR ?? this.clinicAR,
      phonePER: phonePER ?? this.phonePER,
      phoneASS: phoneASS ?? this.phoneASS,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      grid: grid ?? this.grid,
      procedures: procedures ?? this.procedures,
      titles: titles ?? this.titles,
      affiliates: affiliates ?? this.affiliates,
      clinicDetails: clinicDetails ?? this.clinicDetails,
      labs: labs ?? this.labs,
      rads: rads ?? this.rads,
      drugs: drugs ?? this.drugs,
      published: published ?? this.published,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'docnameEN': docnameEN,
      'docnameAR': docnameAR,
      'clinicEN': clinicEN,
      'clinicAR': clinicAR,
      'phonePER': phonePER,
      'phoneASS': phoneASS,
      'password': password,
      'avatar': avatar,
      'grid': grid,
      'procedures': procedures.map((x) => x.toJson()).toList(),
      'titles': titles.map((x) => x.toJson()).toList(),
      'affiliates': affiliates.map((x) => x.toJson()).toList(),
      'clinicDetails': clinicDetails.map((x) => x.toJson()).toList(),
      'labs': labs,
      'rads': rads,
      'drugs': drugs,
      'published': published,
      'fields': fields,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['_id'] as int,
      docnameEN: map['docnameEN'] as String,
      docnameAR: map['docnameAR'] as String,
      clinicEN: map['clinicEN'] as String,
      clinicAR: map['clinicAR'] as String,
      phonePER: map['phonePER'] as String,
      phoneASS: map['phoneASS'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      grid: map['grid'] as bool,
      procedures: List<Procedure>.from(
        (map['procedures'] as List<int>).map<Procedure>(
          (x) => Procedure.fromJson(x as Map<String, dynamic>),
        ),
      ),
      titles: List<Title>.from(
        (map['titles'] as List<int>).map<Title>(
          (x) => Title.fromJson(x as Map<String, dynamic>),
        ),
      ),
      affiliates: List<Affiliate>.from(
        (map['affiliates'] as List<int>).map<Affiliate>(
          (x) => Affiliate.fromJson(x as Map<String, dynamic>),
        ),
      ),
      clinicDetails: List<ClinicDetails>.from(
        (map['clinicDetails'] as List<int>).map<ClinicDetails>(
          (x) => ClinicDetails.fromJson(x as Map<String, dynamic>),
        ),
      ),
      labs: List<String>.from((map['labs'] as List<String>)),
      rads: List<String>.from((map['rads'] as List<String>)),
      drugs: List<String>.from((map['drugs'] as List<String>)),
      published: map['published'] as bool,
      fields: List<String>.from((map['fields'] as List<String>)),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      docnameEN,
      docnameAR,
      clinicEN,
      clinicAR,
      phonePER,
      phoneASS,
      password,
      avatar,
      grid,
      procedures,
      titles,
      affiliates,
      clinicDetails,
      labs,
      rads,
      drugs,
      published,
      fields,
    ];
  }
}
