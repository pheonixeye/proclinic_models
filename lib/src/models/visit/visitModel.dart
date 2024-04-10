// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names, file_names, avoid_print

import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;
import 'package:proclinic_models/src/models/contracts/contract_model.dart';
import 'package:proclinic_models/src/models/visit_supply_item/visit_supply_item.dart';

class Visit extends Equatable {
  final ObjectId id;
  final ObjectId ptId;
  final int? docid;
  final String ptName;
  final String docNameEN;
  final String docNameAR;
  final String clinicEN;
  final String clinicAR;
  final String phone;
  final String visitType;
  final String? procedureEN;
  final String? procedureAR;
  final String visitDate;
  final String dob;
  final String cashType;
  final String affiliationEN;
  final String affiliationAR;
  final int amount;
  final int remaining;
  final List<VisitSupplyItem> supplies;
  final Contract? contract;
  final String? ptInsuranceNumber;

  Visit({
    ObjectId? id,
    required this.docid,
    required this.ptId,
    required this.ptName,
    required this.docNameEN,
    required this.docNameAR,
    required this.clinicEN,
    required this.clinicAR,
    required this.phone,
    required this.visitType,
    required this.procedureEN,
    required this.procedureAR,
    required this.visitDate,
    required this.dob,
    required this.cashType,
    required this.affiliationEN,
    required this.affiliationAR,
    required this.amount,
    required this.remaining,
    required this.supplies,
    required this.contract,
    required this.ptInsuranceNumber,
  }) : id = id ?? ObjectId();

  factory Visit.fromJson(dynamic json) {
    return Visit(
      id: json["_id"],
      ptId: json["ptid"],
      ptName: json[SxVisit.PTNAME],
      docNameEN: json[SxVisit.DOCNAME_E],
      docNameAR: json[SxVisit.DOCNAME_A],
      clinicEN: json[SxVisit.CLINIC_E],
      clinicAR: json[SxVisit.CLINIC_A],
      phone: json[SxVisit.PHONE],
      visitType: json[SxVisit.VISITTYPE],
      procedureEN: json[SxVisit.PROCEDURE_E],
      procedureAR: json[SxVisit.PROCEDURE_A],
      visitDate: json[SxVisit.VISITDATE],
      dob: json[SxVisit.DOB],
      cashType: json[SxVisit.CASHTYPE],
      affiliationEN: json[SxVisit.AFFILIATION_E],
      affiliationAR: json[SxVisit.AFFILIATION_A],
      amount: json[SxVisit.AMOUNT],
      remaining: json[SxVisit.REMAINING],
      docid: json[SxVisit.DOCID],
      supplies: (json[SxVisit.SUPPLIES] as List<dynamic>)
          .map((e) => VisitSupplyItem.fromJson(e))
          .toList(),
      contract:
          json['contract'] == null ? null : Contract.fromJson(json['contract']),
      ptInsuranceNumber: json['ptInsuranceNumber'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      SxVisit.PTID: ptId,
      SxVisit.PTNAME: ptName,
      SxVisit.DOCNAME_E: docNameEN,
      SxVisit.DOCNAME_A: docNameAR,
      SxVisit.CLINIC_E: clinicEN,
      SxVisit.CLINIC_A: clinicAR,
      SxVisit.PHONE: phone,
      SxVisit.VISITTYPE: visitType,
      SxVisit.PROCEDURE_E: visitIsNotProcedure ? null : procedureEN,
      SxVisit.PROCEDURE_A: visitIsNotProcedure ? null : procedureAR,
      SxVisit.VISITDATE: visitDate,
      SxVisit.DOB: dob,
      SxVisit.CASHTYPE: cashType,
      SxVisit.AFFILIATION_E: affiliationEN,
      SxVisit.AFFILIATION_A: affiliationAR,
      SxVisit.AMOUNT: amount,
      SxVisit.REMAINING: remaining,
      SxVisit.DOCID: docid,
      SxVisit.SUPPLIES: supplies.map((e) => e.toJson()).toList(),
      SxVisit.CONTRACT: contract?.toJson(),
      SxVisit.PTINSURANCENUMBER: ptInsuranceNumber,
    };
  }

  static List<Visit> visitList(List<dynamic> json) {
    return json.map((e) => Visit.fromJson(e)).toList();
  }

  @override
  String toString() {
    print(toJson().toString());
    return super.toString();
  }

  double get totalSupplies => supplies
      .map((e) => e.amount * e.price)
      .toList()
      .fold<double>(0, (p, e) => p + e);

  double get totalAmount => amount.toDouble() + totalSupplies;

  bool get visitIsNotProcedure =>
      (visitType == 'Consultation' || visitType == 'Follow Up') &&
      visitType != 'Procedure';

  bool get ptHasNoInsurance => cashType != 'Insurance';

  Visit copyWith({
    ObjectId? id,
    ObjectId? ptId,
    int? docid,
    String? ptName,
    String? docNameEN,
    String? docNameAR,
    String? clinicEN,
    String? clinicAR,
    String? phone,
    String? visitType,
    String? procedureEN,
    String? procedureAR,
    String? visitDate,
    String? dob,
    String? cashType,
    String? affiliationEN,
    String? affiliationAR,
    int? amount,
    int? remaining,
    List<VisitSupplyItem>? supplies,
    Contract? contract,
    String? ptInsuranceNumber,
  }) {
    return Visit(
      id: id ?? this.id,
      ptId: ptId ?? this.ptId,
      docid: docid ?? this.docid,
      ptName: ptName ?? this.ptName,
      docNameEN: docNameEN ?? this.docNameEN,
      docNameAR: docNameAR ?? this.docNameAR,
      clinicEN: clinicEN ?? this.clinicEN,
      clinicAR: clinicAR ?? this.clinicAR,
      phone: phone ?? this.phone,
      visitType: visitType ?? this.visitType,
      procedureEN: procedureEN ?? this.procedureEN,
      procedureAR: procedureAR ?? this.procedureAR,
      visitDate: visitDate ?? this.visitDate,
      dob: dob ?? this.dob,
      cashType: cashType ?? this.cashType,
      affiliationEN: affiliationEN ?? this.affiliationEN,
      affiliationAR: affiliationAR ?? this.affiliationAR,
      amount: amount ?? this.amount,
      remaining: remaining ?? this.remaining,
      supplies: supplies ?? this.supplies,
      contract: ptHasNoInsurance
          ? contract?.contractFromAmount(amount!.toDouble())
          : contract ?? this.contract,
      ptInsuranceNumber: ptInsuranceNumber ?? this.ptInsuranceNumber,
    );
  }

  factory Visit.initial() {
    return Visit(
      id: ObjectId(),
      ptId: ObjectId(),
      docid: 0,
      ptName: '',
      docNameEN: '',
      docNameAR: '',
      clinicEN: '',
      clinicAR: '',
      phone: '',
      visitType: '',
      procedureEN: null,
      procedureAR: null,
      visitDate: '',
      dob: '',
      cashType: '',
      affiliationEN: '',
      affiliationAR: '',
      amount: 0,
      remaining: 0,
      supplies: const [],
      contract: Contract.noContract(),
      ptInsuranceNumber: '',
    );

    //todo: add validate visit method
    //todo: add contracts
    //todo: add patient insurance number
  }
  bool validateVisit() {
    Map<String, bool> validators = {};
    toJson().entries.map((e) {
      switch (e.key) {
        case 'docid':
          (e.value != 0)
              ? validators['docid'] = true
              : validators['docid'] = false;
        case 'ptid':
          (e.value != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'docname':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'docname_a':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'clinic':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'clinic_a':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'phone':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'ptname':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'visittype':
          (e.value != '' &&
                  (e.value == 'Consultation' ||
                      e.value == 'Follow Up' ||
                      e.value == 'Procedure'))
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'cashtype':
          if (e.value != '' &&
              (e.value == 'Cash' ||
                  e.value == 'Visa / MasterCard' ||
                  e.value == 'Insurance')) validators[e.key] = (true);
        case 'visitdate':
          (e.value != '' && DateTime.tryParse(e.value) != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'dob':
          (e.value != '' && DateTime.tryParse(e.value) != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'affiliation':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'affiliation_a':
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case 'contract':
          (e.value != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);

        default:
          validators[e.key] = (true);
      }
    }).toList();
    // print(validators);

    if (validators.entries.any((x) => x.value == false)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  List<Object?> get props {
    return [
      id,
      ptId,
      docid,
      ptName,
      docNameEN,
      docNameAR,
      clinicEN,
      clinicAR,
      phone,
      visitType,
      procedureEN,
      procedureAR,
      visitDate,
      dob,
      cashType,
      affiliationEN,
      affiliationAR,
      amount,
      remaining,
      supplies,
      contract,
      ptInsuranceNumber,
    ];
  }
}

class SxVisit {
  static const String DOCID = "docid";
  static const String PTID = "ptid";
  static const String PTNAME = 'ptname';
  static const String DOCNAME_E = "docname";
  static const String DOCNAME_A = "docname_a";
  static const String CLINIC_E = "clinic";
  static const String CLINIC_A = "clinic_a";
  static const String PHONE = "phone";
  static const String VISITTYPE = "visittype";
  static const String PROCEDURE_E = "procedure";
  static const String PROCEDURE_A = "procedure_a";
  static const String AMOUNT = "amount";
  static const String VISITDATE = "visitdate";
  static const String DOB = "dob";
  static const String REMAINING = "remaining";
  static const String CASHTYPE = "cashtype";
  static const String AFFILIATION_E = "affiliation";
  static const String AFFILIATION_A = "affiliation_a";
  static const String SUPPLIES = "supplies";
  static const String CONTRACT = "contract";
  static const String PTINSURANCENUMBER = "ptInsuranceNumber";
}
