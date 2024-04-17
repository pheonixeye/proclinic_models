part of "./socket_message.dart";

enum MessageType implements EquatableMixin {
  doctorLogin,
  doctorLogout,
  newVisit,
  callNextVisit,
  callSecretary,
  pauseClinic,
  resumeClinic,
  visitUpdatedDoctor,
  visitUpdatedreception;

  factory MessageType.fromString(String value) {
    return switch (value) {
      "doctorLogin" => MessageType.doctorLogin,
      "doctorLogout" => MessageType.doctorLogout,
      "newVisit" => MessageType.newVisit,
      "callNextVisit" => MessageType.callNextVisit,
      "callSecretary" => MessageType.callSecretary,
      "pauseClinic" => MessageType.pauseClinic,
      "resumeClinic" => MessageType.resumeClinic,
      "visitUpdatedDoctor" => MessageType.visitUpdatedDoctor,
      "visitUpdatedreception" => MessageType.visitUpdatedreception,
      _ => throw UnimplementedError(),
    };
  }

  @override
  List<Object> get props => [
        doctorLogin,
        doctorLogout,
        newVisit,
        callNextVisit,
        callSecretary,
        pauseClinic,
        resumeClinic,
        visitUpdatedDoctor,
        visitUpdatedreception,
      ];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return name.split('.').last.toString();
  }
}
