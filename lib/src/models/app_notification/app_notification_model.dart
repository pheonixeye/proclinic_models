// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:proclinic_models/src/models/cron/task_type.dart';
import 'package:proclinic_models/src/models/organizer_appointment/organizer_appointment.dart';
import 'package:proclinic_models/src/models/remaining_fees/remaining_fees.dart';
import 'package:proclinic_models/src/models/supply_item/supply_item.dart';
import 'package:uuid/uuid.dart';

part './type_adapter.dart';

@HiveType(typeId: 0)
class AppNotification extends HiveObject with EquatableMixin {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String titleEn;
  @HiveField(3)
  final String titleAr;
  @HiveField(4)
  final String descriptionEn;
  @HiveField(5)
  final String descriptionAr;
  @HiveField(6)
  final bool isRead;

  AppNotification({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.isRead,
  });

  AppNotification copyWith({
    String? id,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    bool? isRead,
  }) {
    return AppNotification(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'isRead': isRead,
    };
  }

  factory AppNotification.test() {
    return AppNotification(
      id: const Uuid().v4(),
      titleEn: 'Test Notification 1',
      titleAr: 'اختبار اضافة تنبيه',
      descriptionEn:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      descriptionAr:
          'يتم الحرة حاملات الأمريكي ثم. وقرى الأمم حاملات أخذ لم. أم ولم أهّل بلاده, عل ومن وقبل ألمّ. بتطويق والنرويج لبولندا، لم جعل, وقام الأسيوي عل بها. مع إبّان والفلبين باستحداث يبق, في دار أوروبا مقاومة المتحدة.',
      isRead: false,
    );
  }

  factory AppNotification.fromJson(Map<String, dynamic> map) {
    return AppNotification(
      id: map['id'] as String,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn: map['descriptionEn'] as String,
      descriptionAr: map['descriptionAr'] as String,
      isRead: map['isRead'] as bool,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
      isRead,
    ];
  }

  factory AppNotification.fromType(TaskType type, dynamic data) {
    switch (type) {
      case TaskType.organizerDates:
        final OrgAppointement app = data as OrgAppointement;
        return AppNotification(
          id: const Uuid().v4(),
          titleEn: app.clinicEN.toUpperCase(),
          titleAr: app.clinicAR.toUpperCase(),
          descriptionEn:
              "One Hour Remains till Mr. ${app.ptname} Appointment with Dr. ${app.docnameEN} - Mobile: ${app.phone}",
          descriptionAr:
              'باقي ساعة علي موعد ${app.ptname} مع دكتور ${app.docnameAR} - الموبايل : ${app.phone}',
          isRead: false,
        );
      case TaskType.suppliesCount:
        final SupplyItem item = data as SupplyItem;
        return AppNotification(
          id: const Uuid().v4(),
          titleEn: item.nameEn,
          titleAr: item.nameAr,
          descriptionEn:
              "This is an automated Supplies Notification. Remaining Amount of ${item.nameEn} is ${item.amount} Units Only.",
          descriptionAr:
              'باقي في المخزن الخاص ب${item.nameAr} عدد ${item.amount} فقط.',
          isRead: false,
        );
      case TaskType.remainingFees:
        //todo: scheduled to run once the app opens

        final RemainingFees _data = data as RemainingFees;
        return AppNotification(
          id: const Uuid().v4(),
          titleEn: "Some Visits Have Remaining Fees.",
          titleAr: "يوجد زيارات لها باقي في الحساب",
          descriptionEn: _data.toString(),
          descriptionAr: _data.toString(),
          isRead: false,
        );
      case TaskType.others:
        return throw UnimplementedError();
    }
  }
}
