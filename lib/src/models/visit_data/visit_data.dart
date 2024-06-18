// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:proclinic_models/proclinic_models.dart';

class VisitData extends FormHolder with EquatableMixin {
  final int docid;
  final ObjectId visitid;
  final String ptname;
  final String phone;
  final String visittype;
  final String visitdate;
  final Map<String, dynamic> data;
  final List<String> labs;
  final List<String> rads;
  final List<PrescribedDrug> drugs;
  final List<ObjectId> sheetpapers;
  final List<ObjectId> labpapers;
  final List<ObjectId> radpapers;
  final List<ObjectId> drugpapers;
  final List<ObjectId> commentspapers;

  const VisitData({
    required this.docid,
    required this.visitid,
    required this.ptname,
    required this.phone,
    required this.visittype,
    required this.visitdate,
    required this.data,
    required this.labs,
    required this.rads,
    required this.drugs,
    required this.sheetpapers,
    required this.labpapers,
    required this.radpapers,
    required this.drugpapers,
    required this.commentspapers,
    super.formId,
    super.formData,
  });

  factory VisitData.fromJson(dynamic json) {
    return VisitData(
      docid: json[SxVD.DOCID],
      visitid: json[SxVD.VISITID],
      ptname: json[SxVD.PTNAME],
      phone: json[SxVD.PHONE],
      visittype: json[SxVD.VISITTYPE],
      visitdate: json[SxVD.VISITDATE],
      data: json[SxVD.DATA] as Map<String, dynamic>,
      labs: stringifyList(json[SxVD.LABS]),
      rads: stringifyList(json[SxVD.RADS]),
      drugs: (json[SxVD.DRUGS] as List<dynamic>)
          .map((e) => PrescribedDrug.fromJson(e))
          .toList(),
      sheetpapers: objectIdFromDynamic(json[SxVD.SHEETSPAPERS]),
      labpapers: objectIdFromDynamic(json[SxVD.LABSPAPERS]),
      radpapers: objectIdFromDynamic(json[SxVD.RADSPAPERS]),
      drugpapers: objectIdFromDynamic(json[SxVD.DRUGPAPERS]),
      commentspapers: objectIdFromDynamic(json[SxVD.COMMENTSPAPERS]),
      formId: json[SxVD.FORMID] as ObjectId?,
      formData: json[SxVD.FORMDATA] as Map<String, dynamic>?,
    );
  }

  factory VisitData.fromNewVisit(Visit visit) {
    return VisitData(
      docid: visit.docid!,
      visitid: visit.id,
      ptname: visit.ptName,
      phone: visit.phone,
      visittype: visit.visitType,
      visitdate: visit.visitDate,
      data: const {},
      labs: const [],
      rads: const [],
      drugs: const [],
      sheetpapers: const [],
      labpapers: const [],
      radpapers: const [],
      drugpapers: const [],
      commentspapers: const [],
      formId: null,
      formData: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SxVD.DOCID: docid,
      SxVD.VISITID: visitid,
      SxVD.PTNAME: ptname,
      SxVD.PHONE: phone,
      SxVD.VISITTYPE: visittype,
      SxVD.VISITDATE: visitdate,
      SxVD.DATA: data,
      SxVD.DRUGS: drugs.map((e) => e.toJson()).toList(),
      SxVD.LABS: labs,
      SxVD.RADS: rads,
      SxVD.SHEETSPAPERS: sheetpapers,
      SxVD.LABSPAPERS: labpapers,
      SxVD.RADSPAPERS: radpapers,
      SxVD.DRUGPAPERS: drugpapers,
      SxVD.COMMENTSPAPERS: commentspapers,
      SxVD.FORMID: formId,
      SxVD.FORMDATA: formData,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  static List<String> stringifyList(List<dynamic> ld) {
    return ld.map((dynamic e) => e.toString()).toList();
  }

  static List<ObjectId> objectIdFromDynamic(List<dynamic> list) {
    return list.map((e) => e as ObjectId).toList();
  }

  static const Map<String, String> paperData = {
    "Sheet Documents": SxVD.SHEETSPAPERS,
    "Lab Results": SxVD.LABSPAPERS,
    "Radiology Results": SxVD.RADSPAPERS,
    "Perscriptions": SxVD.DRUGPAPERS,
    "Miscellaneous": SxVD.COMMENTSPAPERS,
  };

  @override
  List<Object?> get props {
    return [
      docid,
      visitid,
      ptname,
      phone,
      visittype,
      visitdate,
      data,
      labs,
      rads,
      drugs,
      sheetpapers,
      labpapers,
      radpapers,
      drugpapers,
      commentspapers,
      formId,
      formData,
    ];
  }
}

class SxVD {
  static const String DOCID = "docid";
  static const String VISITID = "visitid";
  static const String PTNAME = 'ptname';
  static const String PHONE = "phone";
  static const String VISITTYPE = "visittype";
  static const String VISITDATE = "visitdate";
  static const String DATA = "medicaldata";
  static const String DRUGS = "drugs";
  static const String LABS = "labs";
  static const String RADS = "rads";
  static const String SHEETSPAPERS = "sheetpapers";
  static const String LABSPAPERS = "labpapers";
  static const String RADSPAPERS = "radpapers";
  static const String DRUGPAPERS = "drugpapers";
  static const String COMMENTSPAPERS = "commentpapers";
  static const String FORMID = "formid";
  static const String FORMDATA = "formdata";
}
