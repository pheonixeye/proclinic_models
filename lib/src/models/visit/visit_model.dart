// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/contracts/contract_model.dart';
import 'package:proclinic_models/src/models/doctor/affiliate/affiliate_model.dart';
import 'package:proclinic_models/src/models/doctor/procedure/procedure_model.dart';
import 'package:proclinic_models/src/models/form_holder/form_holder.dart';
import 'package:proclinic_models/src/models/speciality/speciality.dart';
import 'package:proclinic_models/src/models/visit_supply_item/visit_supply_item.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class Visit extends FormHolder with EquatableMixin {
  final ObjectId id;
  final ObjectId ptId;
  final int? docid;
  final String ptName;
  final String docNameEN;
  final String docNameAR;
  final Speciality speciality;
  final String phone;
  final String visitType;
  final List<Procedure> procedures;
  final String visitDate;
  final String dob;
  final String cashType;
  final Affiliate affiliate;
  final int amount;
  final int remaining;
  final List<VisitSupplyItem> supplies;
  final Contract contract;
  final String? ptInsuranceNumber;

  Visit({
    ObjectId? id,
    required this.docid,
    required this.ptId,
    required this.ptName,
    required this.docNameEN,
    required this.docNameAR,
    required this.speciality,
    required this.phone,
    required this.visitType,
    required this.procedures,
    required this.visitDate,
    required this.dob,
    required this.cashType,
    required this.affiliate,
    required this.amount,
    required this.remaining,
    required this.supplies,
    required this.contract,
    required this.ptInsuranceNumber,
    super.formId,
    super.formData,
  }) : id = id ?? ObjectId();

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      id: json[SxVisit.ID] as ObjectId,
      ptId: json[SxVisit.PTID] as ObjectId,
      ptName: json[SxVisit.PTNAME],
      docNameEN: json[SxVisit.DOCNAME_E],
      docNameAR: json[SxVisit.DOCNAME_A],
      speciality: Speciality.fromJson(json[SxVisit.SPECIALITY]),
      phone: json[SxVisit.PHONE],
      visitType: json[SxVisit.VISITTYPE],
      procedures: (json[SxVisit.PROCEDURES] as List<dynamic>)
          .map((e) => Procedure.fromJson(e))
          .toList(),
      visitDate: json[SxVisit.VISITDATE],
      dob: json[SxVisit.DOB],
      cashType: json[SxVisit.CASHTYPE],
      affiliate: Affiliate.fromJson(json[SxVisit.AFFILIATE]),
      amount: json[SxVisit.AMOUNT],
      remaining: json[SxVisit.REMAINING],
      docid: json[SxVisit.DOCID],
      supplies: (json[SxVisit.SUPPLIES] as List<dynamic>)
          .map((e) => VisitSupplyItem.fromJson(e))
          .toList(),
      contract: Contract.fromJson(json[SxVisit.CONTRACT]),
      ptInsuranceNumber: json[SxVisit.PTINSURANCENUMBER] as String?,
      formId: json[SxVisit.FORMID] as ObjectId?,
      formData: json[SxVisit.FORMDATA] as Map<String, dynamic>?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      SxVisit.ID: id,
      SxVisit.PTID: ptId,
      SxVisit.PTNAME: ptName,
      SxVisit.DOCNAME_E: docNameEN,
      SxVisit.DOCNAME_A: docNameAR,
      SxVisit.SPECIALITY: speciality.toJson(),
      SxVisit.PHONE: phone,
      SxVisit.VISITTYPE: visitType,
      SxVisit.VISITDATE: visitDate,
      SxVisit.DOB: dob,
      SxVisit.CASHTYPE: cashType,
      SxVisit.AFFILIATE: affiliate.toJson(),
      SxVisit.PROCEDURES: procedures.map((e) => e.toJson()).toList(),
      SxVisit.AMOUNT: amount,
      SxVisit.REMAINING: remaining,
      SxVisit.DOCID: docid,
      SxVisit.SUPPLIES: supplies.map((e) => e.toJson()).toList(),
      SxVisit.CONTRACT: contract.toJson(),
      SxVisit.PTINSURANCENUMBER: ptInsuranceNumber,
      SxVisit.FORMID: formId,
      SxVisit.FORMDATA: formData,
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

  double get totalProcedures =>
      procedures.map((e) => e.price).fold<double>(0, (p, e) => p + e);

  double get totalAmount => amount.toDouble() + totalSupplies + totalProcedures;

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
    Speciality? speciality,
    String? phone,
    String? visitType,
    List<Procedure>? procedures,
    String? visitDate,
    String? dob,
    String? cashType,
    Affiliate? affiliate,
    int? amount,
    int? remaining,
    List<VisitSupplyItem>? supplies,
    Contract? contract,
    String? ptInsuranceNumber,
    ObjectId? formId,
    Map<String, dynamic>? formData,
  }) {
    return Visit(
      id: id ?? this.id,
      ptId: ptId ?? this.ptId,
      docid: docid ?? this.docid,
      ptName: ptName ?? this.ptName,
      docNameEN: docNameEN ?? this.docNameEN,
      docNameAR: docNameAR ?? this.docNameAR,
      speciality: speciality ?? this.speciality,
      phone: phone ?? this.phone,
      visitType: visitType ?? this.visitType,
      procedures: procedures ?? this.procedures,
      visitDate: visitDate ?? this.visitDate,
      dob: dob ?? this.dob,
      cashType: cashType ?? this.cashType,
      affiliate: affiliate ?? this.affiliate,
      amount: amount ?? this.amount,
      remaining: remaining ?? this.remaining,
      supplies: supplies ?? this.supplies,
      contract: ptHasNoInsurance
          ? contract!.contractFromAmount(amount!.toDouble())
          : contract ?? this.contract,
      ptInsuranceNumber: ptInsuranceNumber ?? this.ptInsuranceNumber,
      formId: formId ?? this.formId,
      formData: formData ?? this.formData,
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
      speciality: Speciality.noSpeciality(),
      phone: '',
      visitType: '',
      procedures: const [],
      visitDate: '',
      dob: '',
      cashType: '',
      affiliate: Affiliate.noAffiliate(),
      amount: 0,
      remaining: 0,
      supplies: const [],
      contract: Contract.noContract(),
      ptInsuranceNumber: '',
      formId: null,
      formData: null,
    );

    //todo: add validate visit method
    //todo: add contracts
    //todo: add patient insurance number
  }
  bool validateVisit() {
    Map<String, bool> validators = {};
    toJson().entries.map((e) {
      switch (e.key) {
        case SxVisit.DOCID:
          (e.value != 0) ? validators[e.key] = true : validators[e.key] = false;
        case SxVisit.PTID:
          (e.value != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.DOCNAME_E:
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.DOCNAME_A:
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.SPECIALITY:
          (e.value != Speciality.noSpeciality())
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.PHONE:
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.PTNAME:
          (e.value != '')
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.VISITTYPE:
          (e.value != '' &&
                  (e.value == 'Consultation' ||
                      e.value == 'Follow Up' ||
                      e.value == 'Procedure'))
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.CASHTYPE:
          if (e.value != '' &&
              (e.value == 'Cash' ||
                  e.value == 'Visa / MasterCard' ||
                  e.value == 'Insurance')) validators[e.key] = (true);
        case SxVisit.VISITDATE:
          (e.value != '' && DateTime.tryParse(e.value) != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.DOB:
          (e.value != '' && DateTime.tryParse(e.value) != null)
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.AFFILIATE:
          (e.value != Affiliate.noAffiliate())
              ? validators[e.key] = (true)
              : validators[e.key] = (false);
        case SxVisit.CONTRACT:
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
      speciality,
      phone,
      visitType,
      procedures,
      visitDate,
      dob,
      cashType,
      affiliate,
      amount,
      remaining,
      supplies,
      contract,
      ptInsuranceNumber,
      formId,
      formData,
    ];
  }
}

class SxVisit {
  static const String ID = "_id";
  static const String DOCID = "docid";
  static const String PTID = "ptid";
  static const String PTNAME = 'ptname';
  static const String DOCNAME_E = "docname";
  static const String DOCNAME_A = "docname_a";
  static const String SPECIALITY = 'speciality';
  static const String PROCEDURES = 'procedures';
  static const String AFFILIATE = 'affiliate';
  static const String PHONE = "phone";
  static const String VISITTYPE = "visittype";
  static const String AMOUNT = "amount";
  static const String VISITDATE = "visitdate";
  static const String DOB = "dob";
  static const String REMAINING = "remaining";
  static const String CASHTYPE = "cashtype";
  static const String SUPPLIES = "supplies";
  static const String CONTRACT = "contract";
  static const String PTINSURANCENUMBER = "ptInsuranceNumber";
  static const String FORMID = "formid";
  static const String FORMDATA = "formdata";
}
