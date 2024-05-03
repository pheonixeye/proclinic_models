import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class ScheduledExpense extends Equatable {
  final ObjectId id;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final bool recurring;
  final String dateTime;
  final double value;
  final String? notificationTime;
  final int? nMonth;
  final int? nDay;
  final int? nHour;
  final int? nMinute;

  const ScheduledExpense({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.recurring,
    required this.dateTime,
    required this.value,
    required this.notificationTime,
    required this.nMonth,
    required this.nDay,
    required this.nHour,
    required this.nMinute,
  }) : assert(
          recurring
              ? (nDay != null &&
                  nMonth != null &&
                  nHour != null &&
                  nMinute != null)
              : notificationTime != null,
        );

  ScheduledExpense copyWith({
    ObjectId? id,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    bool? recurring,
    String? notificationTime,
    String? dateTime,
    double? value,
    int? nMonth,
    int? nDay,
    int? nHour,
    int? nMinute,
  }) {
    return ScheduledExpense(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      recurring: recurring ?? this.recurring,
      dateTime: dateTime ?? this.dateTime,
      value: value ?? this.value,
      notificationTime: notificationTime ?? this.notificationTime,
      nMonth: nMonth ?? this.nMonth,
      nDay: nDay ?? this.nDay,
      nHour: nHour ?? this.nHour,
      nMinute: nMinute ?? this.nMinute,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'recurring': recurring,
      'notificationTime': notificationTime,
      'dateTime': dateTime,
      'value': value,
      'nMonth': nMonth,
      'nDay': nDay,
      'nHour': nHour,
      'nMinute': nMinute,
    };
  }

  factory ScheduledExpense.fromJson(Map<String, dynamic> map) {
    return ScheduledExpense(
      id: map['id'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn: map['descriptionEn'] as String?,
      descriptionAr: map['descriptionAr'] as String?,
      recurring: map['recurring'] as bool,
      notificationTime: map['notificationTime'] as String,
      dateTime: map['dateTime'] as String,
      value: map['value'] as double,
      nMonth: map['nMonth'] as int,
      nDay: map['nDay'] as int,
      nHour: map['nHour'] as int,
      nMinute: map['nMinute'] as int,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
      recurring,
      notificationTime,
      nMonth,
      nDay,
      nHour,
      nMinute,
      dateTime,
      value,
    ];
  }
}