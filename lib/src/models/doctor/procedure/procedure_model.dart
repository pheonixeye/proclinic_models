import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class Procedure extends Equatable {
  final ObjectId id;
  final String nameEn;
  final String nameAr;
  final double price;
  final bool isAvailable;

  const Procedure({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.isAvailable,
  });

  Procedure copyWith({
    ObjectId? id,
    String? nameEn,
    String? nameAr,
    double? price,
    bool? isAvailable,
  }) {
    return Procedure(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      price: price ?? this.price,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'price': price,
      'isAvailable': isAvailable,
    };
  }

  factory Procedure.fromJson(Map<String, dynamic> map) {
    return Procedure(
      id: (map['_id'] as ObjectId),
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      price: map['price'] as double,
      isAvailable: map['isAvailable'] as bool,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      nameEn,
      nameAr,
      price,
      isAvailable,
    ];
  }
}
