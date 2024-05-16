import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class PrescriptionSettings extends Equatable {
  final ObjectId id;
  final int docId;
  final String? path;
  final bool usePrinted;
  final Map<String, PositionedDataItem> data;

  const PrescriptionSettings({
    required this.id,
    required this.docId,
    required this.path,
    required this.usePrinted,
    required this.data,
  });

  PrescriptionSettings copyWith({
    ObjectId? id,
    int? docId,
    String? path,
    bool? usePrinted,
    Map<String, PositionedDataItem>? data,
  }) {
    return PrescriptionSettings(
      id: id ?? this.id,
      docId: docId ?? this.docId,
      path: path ?? this.path,
      usePrinted: usePrinted ?? this.usePrinted,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'docId': docId,
      'path': path,
      'usePrinted': usePrinted,
      'data': data.map((key, value) => MapEntry(key, value.toJson())),
    };
  }

  factory PrescriptionSettings.fromJson(Map<String, dynamic> map) {
    return PrescriptionSettings(
      id: map['_id'] as ObjectId,
      docId: map['docId'] as int,
      path: map['path'] != null ? map['path'] as String : null,
      usePrinted: map['usePrinted'] as bool,
      data: Map<String, PositionedDataItem>.from(
        (map['data'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, PositionedDataItem.fromJson(value))),
      ),
    );
  }

  factory PrescriptionSettings.create(int docId) {
    final data = {
      for (PosDataType dt in PosDataType.values)
        dt.toString(): PositionedDataItem(
          id: ObjectId(),
          type: dt,
          x: 0,
          y: 0,
          isShown: true,
        )
    };
    return PrescriptionSettings(
      id: ObjectId(),
      docId: docId,
      path: null,
      usePrinted: false,
      data: data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      docId,
      path,
      usePrinted,
      data,
    ];
  }
}

class PositionedDataItem extends Equatable {
  final ObjectId id;
  final PosDataType type;
  final double x;
  final double y;
  final bool isShown;

  const PositionedDataItem({
    required this.id,
    required this.type,
    required this.x,
    required this.y,
    required this.isShown,
  });

  PositionedDataItem copyWith({
    ObjectId? id,
    PosDataType? type,
    double? x,
    double? y,
    bool? isShown,
  }) {
    return PositionedDataItem(
      id: id ?? this.id,
      type: type ?? this.type,
      x: x ?? this.x,
      y: y ?? this.y,
      isShown: isShown ?? this.isShown,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'type': type.toString(),
      'x': x,
      'y': y,
      'isShown': isShown,
    };
  }

  factory PositionedDataItem.fromJson(Map<String, dynamic> map) {
    return PositionedDataItem(
      id: map['_id'] as ObjectId,
      type: PosDataType.fromString(map['type'] as String),
      x: map['x'] as double,
      y: map['y'] as double,
      isShown: map['isShown'] as bool,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      type,
      x,
      y,
      isShown,
    ];
  }
}

enum PosDataType {
  name,
  date,
  age,
  visit,
  drugs,
  labs,
  rads,
  sheet,
  report;

  const PosDataType();

  String forWidgets() {
    return switch (this) {
      PosDataType.name => "Patient Name",
      PosDataType.date => "Visit Date",
      PosDataType.age => "Patient Age",
      PosDataType.visit => "Visit Type",
      PosDataType.drugs => "Prescribed Drugs",
      PosDataType.labs => "Requested Labs",
      PosDataType.rads => "Requested Rads",
      PosDataType.sheet => "Patient Medical Sheet",
      PosDataType.report => "Medical Report",
    };
  }

  factory PosDataType.fromString(String value) {
    return switch (value) {
      'name' => name,
      'date' => date,
      'age' => age,
      'visit' => visit,
      'drugs' => drugs,
      'labs' => labs,
      'rads' => rads,
      'sheet' => sheet,
      'report' => report,
      _ => throw UnimplementedError(),
    };
  }
  @override
  String toString() {
    return this.name.split('.').last;
  }
}
