import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/scheduled_expense/scheduled_expense.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class ExpenseItem extends Equatable {
  final ObjectId id;
  final ObjectId accountId;
  final ObjectId categoryId;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final String dateTime;
  final double value;
  final bool isPaid;
  final ObjectId? recieptFile;

  const ExpenseItem({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.dateTime,
    required this.isPaid,
    required this.value,
    required this.recieptFile,
  });

  ExpenseItem copyWith({
    ObjectId? id,
    ObjectId? accountId,
    ObjectId? categoryId,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    String? dateTime,
    double? value,
    bool? isPaid,
    ObjectId? recieptFile,
  }) {
    return ExpenseItem(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      dateTime: dateTime ?? this.dateTime,
      value: value ?? this.value,
      isPaid: isPaid ?? this.isPaid,
      recieptFile: recieptFile ?? this.recieptFile,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'accountId': accountId,
      'categoryId': categoryId,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'dateTime': dateTime,
      'value': value,
      'isPaid': isPaid,
      'recieptFile': recieptFile,
    };
  }

  factory ExpenseItem.fromJson(Map<String, dynamic> map) {
    return ExpenseItem(
      id: map['_id'] as ObjectId,
      accountId: map['accountId'] as ObjectId,
      categoryId: map['categoryId'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn: map['descriptionEn'] as String?,
      descriptionAr: map['descriptionAr'] as String?,
      dateTime: map['dateTime'] as String,
      value: map['value'] as double,
      isPaid: map['isPaid'] as bool,
      recieptFile: map['recieptFile'] as ObjectId?,
    );
  }

  factory ExpenseItem.create({
    required String titleAr,
    required String titleEn,
    required double value,
    required String dateTime,
    required ObjectId accountId,
    required ObjectId categoryId,
    String? descriptionEn,
    String? descriptionAr,
  }) {
    return ExpenseItem(
      id: ObjectId(),
      accountId: accountId,
      categoryId: categoryId,
      titleEn: titleEn,
      titleAr: titleAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      dateTime: dateTime,
      isPaid: false,
      value: value,
      recieptFile: null,
    );
  }

  factory ExpenseItem.fromScheduledExpense(ScheduledExpense se) {
    return ExpenseItem(
      id: ObjectId(),
      accountId: se.accountId,
      categoryId: se.categoryId,
      titleEn: se.titleEn,
      titleAr: se.titleAr,
      descriptionEn: se.descriptionEn,
      descriptionAr: se.descriptionAr,
      dateTime: se.dateTime,
      isPaid: false,
      value: se.value,
      recieptFile: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      accountId,
      categoryId,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
      dateTime,
      value,
      isPaid,
      recieptFile,
    ];
  }
}
