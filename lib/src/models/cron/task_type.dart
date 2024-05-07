enum TaskType {
  organizerDates,
  suppliesCount,
  remainingFees,
  scheduledExpense,
  //TODO: add other types
  others;

  factory TaskType.fromString(String data) {
    return switch (data) {
      'organizerDates' => TaskType.organizerDates,
      'suppliesCount' => TaskType.suppliesCount,
      'remainingFees' => TaskType.remainingFees,
      'scheduledExpense' => TaskType.scheduledExpense,
      'others' => TaskType.others,
      _ => throw UnimplementedError(),
    };
  }
}
