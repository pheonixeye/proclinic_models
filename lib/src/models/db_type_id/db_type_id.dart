import 'package:equatable/equatable.dart';

class DbTypeId extends Equatable {
  const DbTypeId({
    required this.db,
    required this.type,
    required this.id,
  });

  factory DbTypeId.fromString(String data) {
    final split = data.split(':');
    return DbTypeId(
      db: split[0],
      type: split[1],
      id: split[2] as String?,
    );
  }

  final String db;
  final String type;
  final String? id;

  DbTypeId copyWith({
    String? db,
    String? type,
    String? id,
  }) {
    return DbTypeId(
      db: db ?? this.db,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'db': db,
      'type': type,
      'id': id,
    };
  }

  String get toQuery => '$db:$type:$id';

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [db, type, id];
}
