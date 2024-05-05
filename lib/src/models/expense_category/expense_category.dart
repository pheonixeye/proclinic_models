import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class ExpenseCategory extends Equatable {
  final ObjectId id;
  final ObjectId accountId;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final bool isActive;
  final bool isPublished;
  final String createdAt;

  const ExpenseCategory({
    required this.id,
    required this.accountId,
    required this.titleEn,
    required this.titleAr,
    this.descriptionEn,
    this.descriptionAr,
    required this.isActive,
    required this.isPublished,
    required this.createdAt,
  });

  ExpenseCategory copyWith({
    ObjectId? id,
    ObjectId? accountId,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    bool? isActive,
    bool? isPublished,
    String? createdAt,
  }) {
    return ExpenseCategory(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      isActive: isActive ?? this.isActive,
      isPublished: isPublished ?? this.isPublished,
      createdAt: createdAt ?? this.createdAt,
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
      'isActive': isActive,
      'isPublished': isPublished,
      'createdAt': createdAt
    };
  }

  factory ExpenseCategory.fromJson(Map<String, dynamic> map) {
    return ExpenseCategory(
      id: map['_id'] as ObjectId,
      accountId: map['accountId'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
      isActive: map['isActive'] as bool,
      isPublished: map['isPublished'] as bool,
      createdAt: map['createdAt'] as String,
    );
  }

  factory ExpenseCategory.create({
    required ObjectId accountId,
    required String titleEn,
    required String titleAr,
    String? descriptionEn,
    String? descriptionAr,
  }) {
    return ExpenseCategory(
      id: ObjectId(),
      accountId: accountId,
      titleEn: titleEn,
      titleAr: titleAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      isActive: true,
      isPublished: true,
      createdAt: DateTime.now().toIso8601String(),
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
      isActive,
      isPublished,
      createdAt,
    ];
  }
}
