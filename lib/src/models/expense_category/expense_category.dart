import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class ExpenseCategory extends Equatable {
  final ObjectId id;
  final ObjectId accountId;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;

  const ExpenseCategory({
    required this.id,
    required this.accountId,
    required this.titleEn,
    required this.titleAr,
    this.descriptionEn,
    this.descriptionAr,
  });

  ExpenseCategory copyWith({
    ObjectId? id,
    ObjectId? accountId,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
  }) {
    return ExpenseCategory(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'accountId': accountId,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
    };
  }

  factory ExpenseCategory.fromJson(Map<String, dynamic> map) {
    return ExpenseCategory(
      id: map['id'] as ObjectId,
      accountId: map['accountId'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      accountId,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
    ];
  }
}
