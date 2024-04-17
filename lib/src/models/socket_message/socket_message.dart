// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/translatable/translatable.dart';
import 'package:uuid/uuid.dart';

part "message_direction.dart";
part "message_type.dart";

class SocketNotificationMessage extends Equatable {
  final String id;
  final MessageDirection direction;
  final MessageType type;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final int docid;

  const SocketNotificationMessage({
    required this.id,
    required this.direction,
    required this.type,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.docid,
  });

  SocketNotificationMessage copyWith({
    String? id,
    MessageDirection? direction,
    MessageType? type,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    int? docid,
  }) {
    return SocketNotificationMessage(
      id: id ?? this.id,
      direction: direction ?? this.direction,
      type: type ?? this.type,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      docid: docid ?? this.docid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'direction': direction.toString(),
      'type': type.toString(),
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'docid': docid,
    };
  }

  factory SocketNotificationMessage.fromMap(Map<String, dynamic> map) {
    return SocketNotificationMessage(
      id: map['id'] as String,
      direction: MessageDirection.fromString(map['direction'] as String),
      type: MessageType.fromString(map['type'] as String),
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn: map['descriptionEn'] as String,
      descriptionAr: map['descriptionAr'] as String,
      docid: map['docid'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocketNotificationMessage.fromJson(String source) =>
      SocketNotificationMessage.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      direction,
      type,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
    ];
  }

  factory SocketNotificationMessage.doctorLogin(int docid, Tr tr) {
    return SocketNotificationMessage(
      id: const Uuid().v4(),
      direction: MessageDirection.doctorToReception,
      type: MessageType.doctorLogin,
      titleEn: "Dr. ${tr.e} Clinic.",
      titleAr: "عيادة دكتور ${tr.a}",
      descriptionEn: "Doctor ${tr.e} has logged in.",
      descriptionAr: "قام الدكتور ${tr.a} بالولوج",
      docid: docid,
    );
  }
  factory SocketNotificationMessage.doctorLogout(int docid, Tr tr) {
    return SocketNotificationMessage(
      id: const Uuid().v4(),
      direction: MessageDirection.doctorToReception,
      type: MessageType.doctorLogin,
      titleEn: "Dr. ${tr.e} Clinic.",
      titleAr: "عيادة دكتور ${tr.a}",
      descriptionEn: "Doctor ${tr.e} has logged Out.",
      descriptionAr: "قام الدكتور ${tr.a} بالخروج",
      docid: docid,
    );
  }

  factory SocketNotificationMessage.newVisit(int docid, Tr tr) {
    return SocketNotificationMessage(
      id: const Uuid().v4(),
      direction: MessageDirection.receptionToDoctor,
      type: MessageType.newVisit,
      titleEn: "Dr. ${tr.e} Clinic.",
      titleAr: "عيادة دكتور ${tr.a}",
      descriptionEn: "The Reception Has Added a New Visit.",
      descriptionAr: "تم اضافة زيارة جديدة",
      docid: docid,
    );
  }
}
