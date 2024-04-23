// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Test extends Equatable {
  final String testid;
  final String testSubject;
  const Test({
    required this.testid,
    required this.testSubject,
  });

  Test copyWith({
    String? testid,
    String? testSubject,
  }) {
    return Test(
      testid: testid ?? this.testid,
      testSubject: testSubject ?? this.testSubject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'testid': testid,
      'testSubject': testSubject,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      testid: map['testid'] as String,
      testSubject: map['testSubject'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) =>
      Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [testid, testSubject];
}
