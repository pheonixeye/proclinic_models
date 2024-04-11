import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/visit/visitModel.dart';
import 'package:proclinic_models/src/utils/format_time.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class RemainingFees extends Equatable {
  final String id;
  final Map<ObjectId, Visit> visitsThatHasRemaining;

  const RemainingFees({
    required this.id,
    required this.visitsThatHasRemaining,
  });

  RemainingFees copyWith({
    String? id,
    Map<ObjectId, Visit>? visitsThatHasRemaining,
  }) {
    return RemainingFees(
      id: id ?? this.id,
      visitsThatHasRemaining:
          visitsThatHasRemaining ?? this.visitsThatHasRemaining,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'visitsThatHasRemaining': visitsThatHasRemaining,
    };
  }

  factory RemainingFees.fromJson(Map<String, dynamic> map) {
    return RemainingFees(
      id: map['id'] as String,
      visitsThatHasRemaining: Map<ObjectId, Visit>.from(
        (map['visitsThatHasRemaining'] as Map<ObjectId, Visit>),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, visitsThatHasRemaining];

  @override
  String toString() {
    return visitsThatHasRemaining.entries
        .map((e) {
          return "${e.value.ptName} - ${formatDateWithoutTime(e.value.visitDate)} ==>> ${e.value.remaining}";
        })
        .toList()
        .join("\n");
  }

  // String toArabicString() {}
}
