enum ConrtactPayment {
  all,
  percent,
  zero;

  factory ConrtactPayment.fromString(String value) {
    return switch (value) {
      "all" => ConrtactPayment.all,
      "percent" => ConrtactPayment.percent,
      "zero" => ConrtactPayment.zero,
      _ => throw UnimplementedError(),
    };
  }

  String translate(bool isEnglish) {
    switch (this) {
      case ConrtactPayment.all:
        return isEnglish ? "Full Payment" : "مبلغ كامل";
      case ConrtactPayment.percent:
        return isEnglish ? "Percent % Payment" : "نسبة من المبلغ";
      case ConrtactPayment.zero:
        return isEnglish ? "No Payment" : "لا يوجد دفع";
    }
  }

  @override
  String toString() {
    return name.split(".").removeAt(0);
  }
}
