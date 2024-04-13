// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;
import 'package:proclinic_models/src/models/translatable/translatable.dart';
import 'package:proclinic_models/src/models/visit_supply_item/visit_supply_item.dart';

class SupplyItem extends Equatable {
  final ObjectId id;
  final String nameEn;
  final String nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final double amount;
  final double price;
  final double notifyAmount;
  final int docid;

  const SupplyItem({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    required this.amount,
    required this.price,
    required this.notifyAmount,
    required this.docid,
  });

  SupplyItem copyWith({
    ObjectId? id,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    double? amount,
    double? price,
    double? notifyAmount,
    int? docid,
  }) {
    return SupplyItem(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      notifyAmount: notifyAmount ?? this.notifyAmount,
      docid: docid ?? this.docid,
    );
  }

  SupplyItem updateFromKey(String key, String value) {
    switch (key) {
      case "nameEn":
        return copyWith(
          nameEn: value,
        );
      case "nameAr":
        return copyWith(
          nameAr: value,
        );
      case "descriptionEn":
        return copyWith(
          descriptionEn: value,
        );
      case "descriptionAr":
        return copyWith(
          descriptionAr: value,
        );
      case "amount":
        return copyWith(
          amount: double.parse(value),
        );
      case "price":
        return copyWith(
          price: double.parse(value),
        );
      case "notifyAmount":
        return copyWith(
          notifyAmount: double.parse(value),
        );
      case "docid":
        return copyWith(
          docid: int.parse(value),
        );
      default:
        throw UnimplementedError();
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'amount': amount,
      'price': price,
      'notifyAmount': notifyAmount,
      'docid': docid,
    };
  }

  factory SupplyItem.fromMap(Map<String, dynamic> map) {
    return SupplyItem(
      id: map['_id'] as ObjectId,
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
      amount: map['amount'] as double,
      price: map['price'] as double,
      notifyAmount: map['notifyAmount'] as double,
      docid: map['docid'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplyItem.fromJson(String source) =>
      SupplyItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      nameEn,
      nameAr,
      amount,
      price,
      notifyAmount,
      docid,
    ];
  }

  factory SupplyItem.initial() {
    return SupplyItem(
      id: ObjectId(),
      nameEn: '',
      nameAr: '',
      amount: 0,
      price: 0,
      descriptionAr: null,
      descriptionEn: null,
      notifyAmount: 0,
      docid: 0,
    );
  }

  static final Map<String, Tr> forWidgets = {
    'nameEn': const Tr(a: "الاسم بالانجليزي", e: "English Name"),
    'nameAr': const Tr(a: "الاسم بالعربي", e: "Arabic Name"),
    'descriptionEn': const Tr(a: "الوصف بالانجليزي", e: "English Description"),
    'descriptionAr': const Tr(a: "الوصف بالعربي", e: "Arabic Description"),
    'amount': const Tr(a: "الكمية المتاحة", e: "Available Amount"),
    'price': const Tr(a: "سعر الوحدة", e: "Price Per Unit"),
    'notifyAmount': const Tr(a: "كمية التنبيه", e: "Notify At Amount"),
    'docid': const Tr(a: "خاص بعيادة", e: "For Doctor"),
  };

  VisitSupplyItem toVisitSupplyItem() {
    return VisitSupplyItem(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      amount: 1.0,
      price: price,
    );
  }
}
