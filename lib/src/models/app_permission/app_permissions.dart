import 'package:equatable/equatable.dart';

enum AppPermission implements Equatable {
  admin,
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
  inventory,
  contracts;

  factory AppPermission.fromString(String value) {
    return switch (value) {
      'admin' => admin,
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
      'contracts' => contracts,
      _ => throw UnimplementedError(),
    };
  }

  @override
  String toString() {
    return name.split(".")[1];
  }

  @override
  List<Object> get props => [
        admin,
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
        inventory,
        contracts
      ];

  @override
  bool get stringify => true;
}
