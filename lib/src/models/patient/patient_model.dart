// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:proclinic_models/src/models/form_holder/form_holder.dart';

class Patient extends FormHolder with EquatableMixin {
  final ObjectId id;
  final String name;
  final String phone;
  final String dob;
  final String? insuranceNumber;
  // final ObjectId? formId;
  // final Map<String, dynamic>? formData;

  const Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.dob,
    required this.insuranceNumber,
    super.formId,
    super.formData,
  });

  Patient copyWith({
    ObjectId? id,
    String? name,
    String? phone,
    String? dob,
    String? insuranceNumber,
    ObjectId? formId,
    Map<String, dynamic>? formData,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      insuranceNumber: insuranceNumber ?? this.insuranceNumber,
      formId: formId ?? this.formId,
      formData: formData ?? this.formData,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'phone': phone,
      'dob': dob,
      'insuranceNumber': insuranceNumber,
      'formid': formId,
      'formdata': formData,
    };
  }

  factory Patient.fromJson(Map<String, dynamic> map) {
    return Patient(
      id: map["_id"] as ObjectId,
      name: map['name'] as String,
      phone: map['phone'] as String,
      dob: map['dob'] as String,
      insuranceNumber: map['insuranceNumber'] as String?,
      formId: map['formid'] as ObjectId?,
      formData: map['formdata'] as Map<String, dynamic>?,
    );
  }

  static List<Patient> list(List<dynamic> json) {
    return json.map((e) => Patient.fromJson(e)).toList();
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, phone, dob, formId, formData];

  factory Patient.initial() {
    return Patient(
      id: ObjectId(),
      name: '',
      phone: '',
      dob: '',
      insuranceNumber: null,
      formId: null,
      formData: null,
    );
  }

  //todo: add patient insurance number if present
}
