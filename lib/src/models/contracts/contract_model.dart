// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;
import 'package:proclinic_models/src/models/contracts/contract_payment.dart';
import 'package:proclinic_models/src/models/translatable/translatable.dart';

class Contract extends Equatable {
  final ObjectId id;
  final String nameEn;
  final String nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final ConrtactPayment payment;
  final double doctorPercentage;
  final double patientPaymentPercent;
  final double contractPricePerVisit;
  final bool isActive;

  const Contract({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    required this.payment,
    required this.doctorPercentage,
    required this.patientPaymentPercent,
    required this.contractPricePerVisit,
    required this.isActive,
  });

  Contract copyWith({
    ObjectId? id,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    ConrtactPayment? payment,
    double? doctorPercentage,
    double? patientPaymentPercent,
    double? contractPricePerVisit,
    bool? isActive,
  }) {
    return Contract(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      payment: payment ?? this.payment,
      doctorPercentage: doctorPercentage ?? this.doctorPercentage,
      patientPaymentPercent:
          patientPaymentPercent ?? this.patientPaymentPercent,
      contractPricePerVisit:
          contractPricePerVisit ?? this.contractPricePerVisit,
      isActive: isActive ?? this.isActive,
    );
  }

  factory Contract.createFromJson(Map<String, dynamic> map) {
    return Contract(
      id: ObjectId(),
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
      payment: ConrtactPayment.fromString(map['payment'] as String),
      doctorPercentage: double.parse(map['doctorPercentage']),
      patientPaymentPercent: double.parse(map['patientPaymentPercent']),
      contractPricePerVisit: double.parse(map['contractPricePerVisit']),
      isActive: true,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'payment': payment.toString(),
      'doctorPercentage': doctorPercentage,
      'patientPaymentPercent': patientPaymentPercent,
      'contractPricePerVisit': contractPricePerVisit,
      'isActive': isActive,
    };
  }

  factory Contract.fromJson(Map<String, dynamic> map) {
    return Contract(
      id: map['_id'] as ObjectId,
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
      payment: ConrtactPayment.fromString(map['payment'] as String),
      doctorPercentage: map['doctorPercentage'] as double,
      patientPaymentPercent: map['patientPaymentPercent'] as double,
      contractPricePerVisit: map['contractPricePerVisit'] as double,
      isActive: map['isActive'] as bool,
    );
  }

  @override
  bool get stringify => true;

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props {
    return [
      id,
      nameEn,
      nameAr,
      descriptionEn,
      descriptionAr,
      payment,
      doctorPercentage,
      patientPaymentPercent,
      contractPricePerVisit,
    ];
  }

  String numberDescriptors(bool isEnglish) {
    return isEnglish
        ? "Payment : ${payment.translate(isEnglish)}\nDoctor Percent % : $doctorPercentage\nPatient Payment Percent % : $patientPaymentPercent\nPrice Per Visit : $contractPricePerVisit"
        : "الدفع : ${payment.translate(isEnglish)}\nنسبة الدكتور : $doctorPercentage\nنسبة دفع المريض : $patientPaymentPercent\nثمن الزيارة : $contractPricePerVisit";
  }

  static const _noContract = "__noContract";
  static String get _nc =>
      _noContract.codeUnits.map((e) => e.toRadixString(16)).toList().join();

  factory Contract.noContract([double? amount]) {
    // print(_nc);
    return Contract(
      id: ObjectId.fromHexString(_nc),
      nameEn: 'No Contract',
      nameAr: 'بدون تعاقد',
      descriptionEn: "No Insurance Contract Attached.",
      descriptionAr: "لا يوجد تعاقد مع جهة تأمين",
      payment: ConrtactPayment.all,
      doctorPercentage: 100,
      patientPaymentPercent: 100,
      contractPricePerVisit: amount ?? 0,
      isActive: true,
    );
  }

  Contract contractFromAmount(double amount) {
    return Contract.noContract(amount);
  }

  static final Map<String, Tr> forWidgets = {
    'nameEn': const Tr(a: "الاسم بالانجليزي", e: "English Name"),
    'nameAr': const Tr(a: "الاسم بالعربي", e: "Arabic Name"),
    'descriptionEn': const Tr(a: "الوصف بالانجليزي", e: "English Description"),
    'descriptionAr': const Tr(a: "الوصف بالعربي", e: "Arabic Description"),
    'payment': const Tr(a: "طريقة الحساب", e: "Payment Form"),
    'doctorPercentage': const Tr(a: "نسبة الدكتور", e: "Doctor Percent %"),
    'patientPaymentPercent':
        const Tr(a: "نسبة دفع المريض", e: "Patient Payment Percent %"),
    'contractPricePerVisit':
        const Tr(a: "ثمن الزيارة في العقد", e: "Price Per Visit In Contract"),
    'isActive': const Tr(a: "مفعل", e: "is Active"),
  };
}
