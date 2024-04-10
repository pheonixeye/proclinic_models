// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Patient extends Equatable {
  final ObjectId id;
  final String name;
  final String phone;
  final String dob;
  final String? insuranceNumber;

  const Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.dob,
    required this.insuranceNumber,
  });

  Patient copyWith({
    ObjectId? id,
    String? name,
    String? phone,
    String? dob,
    String? insuranceNumber,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // '_id': id,
      'name': name,
      'phone': phone,
      'dob': dob,
      'insuranceNumber': insuranceNumber,
    };
  }

  factory Patient.fromJson(Map<String, dynamic> map) {
    return Patient(
      id: map["_id"] as ObjectId,
      name: map['name'] as String,
      phone: map['phone'] as String,
      dob: map['dob'] as String,
      insuranceNumber: map['insuranceNumber'] as String?,
    );
  }

  static List<Patient> list(List<dynamic> json) {
    return json.map((e) => Patient.fromJson(e)).toList();
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, phone, dob];

  factory Patient.initial() {
    return Patient(
      id: ObjectId(),
      name: '',
      phone: '',
      dob: '',
      insuranceNumber: null,
    );
  }

  //todo: add patient insurance number if present
}
