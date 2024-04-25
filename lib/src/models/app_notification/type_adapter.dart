part of "./app_notification_model.dart";

class AppNotificationAdapter extends TypeAdapter<AppNotification> {
  @override
  int get typeId => 0;

  @override
  AppNotification read(BinaryReader reader) {
    return AppNotification(
      id: reader.read(),
      titleEn: reader.read(),
      titleAr: reader.read(),
      descriptionEn: reader.read(),
      descriptionAr: reader.read(),
      isRead: reader.read(),
      dateTime: reader.read(),
      visitid: reader.read(),
      messageType: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, AppNotification obj) {
    writer
      ..write(obj.id)
      ..write(obj.titleEn)
      ..write(obj.titleAr)
      ..write(obj.descriptionEn)
      ..write(obj.descriptionAr)
      ..write(obj.isRead)
      ..write(obj.dateTime)
      ..write(obj.visitid)
      ..write(obj.messageType);
  }
}
