import 'package:equatable/equatable.dart';

enum AppPermission implements Equatable {
  newVisit,
  todayVisits,
  updateVisit,
  deleteVisit,
  appOrganizer,
  deleteNotification,
  deleteNotifications,
  visitsDatabase,
  newDoctor,
  newSpeciality,
  accounts,
  createAccount,
  changeAccountActivity,
  updateAccountPermissions,
  expenses,
  createExpense,
  updateExpense,
  deleteExpense,
  createExpenseCategory,
  changeExpenseCategoryActivity,
  deleteExpenseCategoryActivity,
  bookKeeping,
  inventory,
  contracts,
  settings,
  attachFormToVisit,
  detachFormFromVisit,
  editFormOfVisit,
  patientDatabase,
  editPatientProfile,
  attachFormToPatient,
  detachFormFromPatient,
  editFormOfPatient,
  noRequiredPermission;

  factory AppPermission.fromString(String value) {
    return switch (value) {
      'accounts' => accounts,
      'createAccount' => createAccount,
      'changeAccountActivity' => changeAccountActivity,
      'updateAccountPermissions' => updateAccountPermissions,
      'newVisit' => newVisit,
      'todayVisits' => todayVisits,
      'updateVisit' => updateVisit,
      'deleteVisit' => deleteVisit,
      'appOrganizer' => appOrganizer,
      'deleteNotification' => deleteNotification,
      'deleteNotifications' => deleteNotifications,
      'visitsDatabase' => visitsDatabase,
      'newDoctor' => newDoctor,
      'newSpeciality' => newSpeciality,
      'bookKeeping' => bookKeeping,
      'inventory' => inventory,
      'expenses' => expenses,
      'createExpense' => createExpense,
      'updateExpense' => updateExpense,
      'deleteExpense' => deleteExpense,
      'createExpenseCategory' => createExpenseCategory,
      'changeExpenseCategoryActivity' => changeExpenseCategoryActivity,
      'deleteExpenseCategoryActivity' => deleteExpenseCategoryActivity,
      'contracts' => contracts,
      'settings' => settings,
      "attachFormToVisit" => attachFormToVisit,
      "detachFormFromVisit" => detachFormFromVisit,
      "editFormOfVisit" => editFormOfVisit,
      "patientDatabase" => patientDatabase,
      "editPatientProfile" => editPatientProfile,
      "attachFormToPatient" => attachFormToPatient,
      "detachFormFromPatient" => detachFormFromPatient,
      "editFormOfPatient" => editFormOfPatient,
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
        AppPermission.changeAccountActivity,
        AppPermission.updateAccountPermissions,
        AppPermission.newVisit,
        AppPermission.todayVisits,
        AppPermission.updateVisit,
        AppPermission.deleteVisit,
        AppPermission.appOrganizer,
        AppPermission.deleteNotification,
        AppPermission.deleteNotifications,
        AppPermission.visitsDatabase,
        AppPermission.newDoctor,
        AppPermission.newSpeciality,
        AppPermission.bookKeeping,
        AppPermission.expenses,
        AppPermission.createExpense,
        AppPermission.updateExpense,
        AppPermission.deleteExpense,
        AppPermission.createExpenseCategory,
        AppPermission.changeExpenseCategoryActivity,
        AppPermission.deleteExpenseCategoryActivity,
        AppPermission.inventory,
        AppPermission.contracts,
        AppPermission.settings,
        AppPermission.attachFormToVisit,
        AppPermission.detachFormFromVisit,
        AppPermission.editFormOfVisit,
        AppPermission.patientDatabase,
        AppPermission.editPatientProfile,
        AppPermission.attachFormToPatient,
        AppPermission.detachFormFromPatient,
        AppPermission.editFormOfPatient,
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
        AppPermission.visitsDatabase => "قاعدة بيانات الزيارات",
        AppPermission.newDoctor => "اضافة ملف طبيب جديد",
        AppPermission.newSpeciality => "اضافة تخصص طبي جديد",
        AppPermission.accounts => "حسابات السكيرتارية",
        AppPermission.createAccount => "انشاء حساب سكيرتارية",
        AppPermission.changeAccountActivity => "تفعيل / وقف حساب سكيرتارية",
        AppPermission.updateAccountPermissions =>
          "تعديل صلاحيات حساب سكيرتارية",
        AppPermission.expenses => "المصاريف",
        AppPermission.createExpense => "اضافة مصروفات",
        AppPermission.updateExpense => "تعديل مصروفات",
        AppPermission.deleteExpense => "الغاء مصروفات",
        AppPermission.createExpenseCategory => 'انشاء حساب مصروفات جديد',
        AppPermission.changeExpenseCategoryActivity =>
          'تعديل استخدام / وقف حساب مصروفات',
        AppPermission.deleteExpenseCategoryActivity => 'الغاء حساب مصروفات',
        AppPermission.bookKeeping => "الحسابات",
        AppPermission.inventory => "المخزن",
        AppPermission.contracts => "العقود",
        AppPermission.settings => "الاعدادات",
        AppPermission.attachFormToVisit => "اضافة نموذج للزيارة",
        AppPermission.detachFormFromVisit => "ازالة نموذج من الزيارة",
        AppPermission.editFormOfVisit => "تعديل نموذج الزيارة",
        AppPermission.patientDatabase => "دخول قاعدة بيانات المرضي",
        AppPermission.editPatientProfile => "تعديل ملف مريض",
        AppPermission.attachFormToPatient => "اضافة نموذج لملف مريض",
        AppPermission.detachFormFromPatient => "ازالة نموذج من ملف مريض",
        AppPermission.editFormOfPatient => "تعديل نموذج بملف مريض",
        AppPermission.noRequiredPermission => "صلاحية غير مطلوبة",
      };
    }
  }
}
