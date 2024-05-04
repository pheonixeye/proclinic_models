import 'package:equatable/equatable.dart';

enum AppPermission implements Equatable {
  newVisit,
  todayVisits,
  updateVisit,
  deleteVisit,
  appOrganizer,
  deleteNotification,
  deleteNotifications,
  patientDatabase,
  newDoctor,
  newSpeciality,
  accounts,
  createAccount,
  deleteAccount,
  updateAccountPermissions,
  expenses,
  createExpense,
  updateExpense,
  deleteExpense,
  bookKeeping,
  inventory,
  contracts,
  settings,
  noRequiredPermission;

  factory AppPermission.fromString(String value) {
    return switch (value) {
      'accounts' => accounts,
      'createAccount' => createAccount,
      'deleteAccount' => deleteAccount,
      'updateAccountPermissions' => updateAccountPermissions,
      'newVisit' => newVisit,
      'todayVisits' => todayVisits,
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
      'createExpense' => createExpense,
      'updateExpense' => updateExpense,
      'deleteExpense' => deleteExpense,
      'contracts' => contracts,
      'settings' => settings,
      'noRequiredPermission' => noRequiredPermission,
      _ => throw UnimplementedError(),
    };
  }

  @override
  String toString() {
    return name.split(".").last;
  }

  @override
  List<Object> get props => [
        AppPermission.accounts,
        AppPermission.createAccount,
        AppPermission.deleteAccount,
        AppPermission.updateAccountPermissions,
        AppPermission.newVisit,
        AppPermission.todayVisits,
        AppPermission.updateVisit,
        AppPermission.deleteVisit,
        AppPermission.appOrganizer,
        AppPermission.deleteNotification,
        AppPermission.deleteNotifications,
        AppPermission.patientDatabase,
        AppPermission.newDoctor,
        AppPermission.newSpeciality,
        AppPermission.bookKeeping,
        AppPermission.expenses,
        AppPermission.createExpense,
        AppPermission.updateExpense,
        AppPermission.deleteExpense,
        AppPermission.inventory,
        AppPermission.contracts,
        AppPermission.settings,
        AppPermission.noRequiredPermission,
      ];

  @override
  bool get stringify => true;

  String tr(bool isEnglish) {
    if (isEnglish) {
      return toString();
    } else {
      return switch (this) {
        AppPermission.todayVisits => "زيارات اليوم",
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
        AppPermission.createAccount => "انشاء حساب سكيرتارية",
        AppPermission.deleteAccount => "الغاء حساب سكيرتارية",
        AppPermission.updateAccountPermissions =>
          "تعديل صلاحيات حساب سكيرتارية",
        AppPermission.expenses => "المصاريف",
        AppPermission.createExpense => "اضافة مصروفات",
        AppPermission.updateExpense => "تعديل مصروفات",
        AppPermission.deleteExpense => "الغاء مصروفات",
        AppPermission.bookKeeping => "الحسابات",
        AppPermission.inventory => "المخزن",
        AppPermission.contracts => "العقود",
        AppPermission.settings => "الاعدادات",
        AppPermission.noRequiredPermission => "صلاحية غير مطلوبة",
      };
    }
  }
}
