part of "./socket_message.dart";

enum MessageDirection implements EquatableMixin {
  receptionToDoctor,
  doctorToReception;

  @override
  List<Object> get props => [
        receptionToDoctor,
        doctorToReception,
      ];

  @override
  bool get stringify => true;

  factory MessageDirection.fromString(String value) {
    return switch (value) {
      "receptionToDoctor" => MessageDirection.receptionToDoctor,
      "doctorToReception" => MessageDirection.doctorToReception,
      _ => throw UnimplementedError(),
    };
  }

  @override
  String toString() {
    return name.split('.').last.toString();
  }
}
