enum TaskType {
  organizerDates,
  suppliesCount,
  remainingFees,
  //todo: add other types
  others;

  factory TaskType.fromString(String data) {
    return switch (data) {
      'organizerDates' => TaskType.organizerDates,
      'suppliesCount' => TaskType.suppliesCount,
      'remainingFees' => TaskType.remainingFees,
      'others' => TaskType.others,
      _ => throw UnimplementedError(),
    };
  }
}
