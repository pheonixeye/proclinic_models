import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/expense_item/expense_item.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class ScheduledExpense extends Equatable {
  final ObjectId id;
  final ObjectId accountId;
  final ObjectId categoryId;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final bool recurring;
  final String dateTime;
  final double value;
  final String notificationTime;
  final RecurringRate rate;

  const ScheduledExpense({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.recurring,
    required this.dateTime,
    required this.value,
    required this.notificationTime,
    required this.rate,
  });

  ScheduledExpense copyWith({
    ObjectId? id,
    ObjectId? accountId,
    ObjectId? categoryId,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    bool? recurring,
    String? notificationTime,
    String? dateTime,
    double? value,
    RecurringRate? rate,
  }) {
    return ScheduledExpense(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      recurring: recurring ?? this.recurring,
      dateTime: dateTime ?? this.dateTime,
      value: value ?? this.value,
      notificationTime: notificationTime ?? this.notificationTime,
      rate: rate ?? this.rate,
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
      'recurring': recurring,
      'notificationTime': notificationTime,
      'dateTime': dateTime,
      'value': value,
      'rate': rate.toString(),
    };
  }

  factory ScheduledExpense.fromJson(Map<String, dynamic> map) {
    return ScheduledExpense(
      id: map['_id'] as ObjectId,
      accountId: map['accountId'] as ObjectId,
      categoryId: map['categoryId'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn: map['descriptionEn'] as String?,
      descriptionAr: map['descriptionAr'] as String?,
      recurring: map['recurring'] as bool,
      notificationTime: map['notificationTime'] as String,
      dateTime: map['dateTime'] as String,
      value: map['value'] as double,
      rate: RecurringRate.fromString(map['rate'] as String),
    );
  }

  factory ScheduledExpense.fromExpenseItem({
    required ExpenseItem item,
    required bool recurring,
    required String notificationTime,
    required RecurringRate rate,
    required String dateTime,
    double? value,
  }) {
    return ScheduledExpense(
      id: ObjectId(),
      accountId: item.accountId,
      categoryId: item.categoryId,
      titleEn: item.titleEn,
      titleAr: item.titleAr,
      descriptionEn: item.descriptionEn,
      descriptionAr: item.descriptionAr,
      recurring: recurring,
      dateTime: dateTime,
      value: value ?? item.value,
      notificationTime: notificationTime,
      rate: rate,
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
      recurring,
      notificationTime,
      rate,
      dateTime,
      value,
    ];
  }
}

enum RecurringRate {
  monthly,
  weekly,
  daily;

  @override
  String toString() {
    return name.split(".").last;
  }

  const RecurringRate();

  String newDate(String dateTime) {
    DateTime d = DateTime.parse(dateTime);
    switch (this) {
      case RecurringRate.monthly:
        d = d.add(const Duration(hours: 720));
        break;
      case RecurringRate.weekly:
        d = d.add(const Duration(hours: 168));
        break;
      case RecurringRate.daily:
        d = d.add(const Duration(hours: 24));
        break;
    }
    return d.toIso8601String();
  }

  factory RecurringRate.fromString(String value) {
    return switch (value) {
      'monthly' => RecurringRate.monthly,
      'weekly' => RecurringRate.weekly,
      'daily' => RecurringRate.daily,
      _ => throw UnimplementedError(),
    };
  }

  String tr(bool isEnglish) {
    if (isEnglish) {
      return toString();
    } else {
      return switch (this) {
        RecurringRate.monthly => 'شهري',
        RecurringRate.weekly => 'اسبوعي',
        RecurringRate.daily => 'يومي',
      };
    }
  }
}
