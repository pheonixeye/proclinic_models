import 'package:equatable/equatable.dart';

enum AppPermission implements Equatable {
  newVisit,
  updateVisit,
  deleteVisit,
  appOrganizer,
  deleteNotification,
  deleteNotifications,
  patientDatabase,
  newDoctor,
  newSpeciality,
  accounts,
  expenses,
  bookKeeping,
  inventory,
  contracts;

  factory AppPermission.fromString(String value) {
    return switch (value) {
      'accounts' => accounts,
      'newVisit' => newVisit,
      'updateVisit' => updateVisit,
      'deleteVisit' => deleteVisit,
      'appOrganizer' => appOrganizer,
      'deleteNotification' => deleteNotification,
      'deleteNotifications' => deleteNotifications,
      'patientDatabase' => patientDatabase,
      'newDoctor' => newDoctor,
      'newSpeciality' => newSpeciality,
      'bookKeeping' => bookKeeping,
      'inventory' => inventory,
      'expenses' => expenses,
      'contracts' => contracts,
      _ => throw UnimplementedError(),
    };
  }

  @override
  String toString() {
    return name.split(".").last;
  }

  @override
  List<Object> get props => [
        accounts,
        newVisit,
        updateVisit,
        deleteVisit,
        appOrganizer,
        deleteNotification,
        deleteNotifications,
        patientDatabase,
        newDoctor,
        newSpeciality,
        bookKeeping,
        expenses,
        inventory,
        contracts
      ];

  @override
  bool get stringify => true;

  String tr(bool isEnglish) {
    if (isEnglish) {
      return toString();
    } else {
      return switch (this) {
        AppPermission.newVisit => "اضافة زيارة جديدة",
        AppPermission.updateVisit => "تعديل بيانات زيارة",
        AppPermission.deleteVisit => "الغاء بيانات زيارة",
        AppPermission.appOrganizer => "ترتيب المواعيد",
        AppPermission.deleteNotification => "الغاء تنبيه",
        AppPermission.deleteNotifications => "الغاء كل التنبيهات",
        AppPermission.patientDatabase => "قاعدة بيانات المرضي",
        AppPermission.newDoctor => "اضافة ملف طبيب جديد",
        AppPermission.newSpeciality => "اضافة تخصص طبي جديد",
        AppPermission.accounts => "حسابات السكيرتارية",
        AppPermission.expenses => "المصاريف",
        AppPermission.bookKeeping => "الحسابات",
        AppPermission.inventory => "المخزن",
        AppPermission.contracts => "العقود",
      };
    }
  }
}
