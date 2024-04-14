// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/contracts/contract_model.dart';
import 'package:proclinic_models/src/models/doctor/procedure/procedure_model.dart';

import 'package:proclinic_models/src/models/visit/visitModel.dart';
import 'package:proclinic_models/src/models/visit_supply_item/visit_supply_item.dart';

class KeepingAnalysisData extends Equatable {
  final List<Visit> visits;
  final bool isEnglish;
  KeepingAnalysisData({
    required this.visits,
    this.isEnglish = true,
  });

  @override
  List<Object?> get props => [visits, isEnglish];

  int _numberOfConsultations() {
    List<Visit> consultations = [];
    visits.map((e) {
      if (e.visitType == 'Consultation') {
        consultations.add(e);
      }
    }).toList();
    return consultations.length;
  }

  int get numberOfConsultations => _numberOfConsultations();

  int _numberOfFollowUps() {
    List<Visit> followups = [];
    visits.map((e) {
      if (e.visitType == 'Follow Up') {
        followups.add(e);
      }
    }).toList();
    return followups.length;
  }

  int get numberOfFollowups => _numberOfFollowUps();

  int _numberOfProcedures() {
    List<Visit> procedures = [];
    visits.map((e) {
      if (e.visitType == 'Procedure') {
        procedures.add(e);
      }
    }).toList();
    return procedures.length;
  }

  int get numberOfProcedures => _numberOfProcedures();

  List<String> _procedureAnalysis() {
    Map<String, List<Procedure>> data = {};
    visits.map((x) {
      data[x.id.oid] = x.procedures;
    }).toList();
    List<Procedure> allProcedures = [];
    data.entries.map((e) {
      e.value.map((x) {
        allProcedures.add(x);
      }).toList();
    }).toList();
    Map<Procedure, int> procedureCount = {};
    allProcedures.map((p) {
      procedureCount.update(
        p,
        (value) => value + 1,
        ifAbsent: () {
          return 1;
        },
      );
    }).toList();
    return procedureCount.entries.map((e) {
      return isEnglish
          ? "${e.key.nameEn} = ${e.value}"
          : "${e.key.nameAr} = ${e.value}";
    }).toList();
  }

  List<String> get procedureAnalysis => _procedureAnalysis();

  double _totalIncome() {
    List<double> incomne = [];
    visits.map((e) {
      incomne.add(e.totalAmount);
    }).toList();
    double total = incomne.fold<double>(0, (a, b) => a + b);
    return total;
  }

  double get totalIncome => _totalIncome();

  double _totalRemaining() {
    List<double> remaining = [];
    visits.map((e) {
      remaining.add(e.remaining.toDouble());
    }).toList();
    double total = remaining.fold<double>(0, (a, b) => a + b);
    return total;
  }

  double get totalRemaining => _totalRemaining();

  Map<String, int> _affiliationAnalysis() {
    List<String> affiliations = [];
    Map<String, int> analysis = {};
    visits.map((e) {
      affiliations
          .add(isEnglish ? e.affiliate.affiliateEn : e.affiliate.affiliateAr);
    }).toList();
    affiliations.map((e) {
      if (analysis[e] != null) {
        analysis[e] = analysis[e]! + 1;
      } else {
        analysis[e] = 1;
      }
    }).toList();
    return analysis;
  }

  Map<String, int> get affiliationAnalysis => _affiliationAnalysis();

  Map<String, int> _contractsAnalysis() {
    List<Contract> contracts = [];
    visits.map((visit) => contracts.add(visit.contract)).toList();
    Map<String, int> contractsAnalysis = {};
    contracts.map((e) {
      final key = isEnglish ? e.nameEn : e.nameAr;
      if (contractsAnalysis[key] != null) {
        contractsAnalysis[key] = contractsAnalysis[key]! + 1;
      } else {
        contractsAnalysis[key] = 1;
      }
    }).toList();
    return contractsAnalysis;
  }

  Map<String, int> get contractsAnalysis => _contractsAnalysis();

  Map<String, Map<String, double>> _suppliesAnalysis() {
    List<VisitSupplyItem> allSupplies = [];
    visits.map((e) {
      allSupplies.addAll(e.supplies);
    }).toList();
    Map<String, double> suppliesCounts = {};
    allSupplies.map((e) {
      final key = isEnglish ? e.nameEn : e.nameAr;
      if (suppliesCounts[key] != null) {
        suppliesCounts[key] = suppliesCounts[key]! + e.amount;
      } else {
        suppliesCounts[key] = e.amount;
      }
    }).toList();
    Map<String, double> suppliesPrices = {};
    allSupplies.map((e) {
      final key = isEnglish ? e.nameEn : e.nameAr;
      suppliesCounts.entries.map((counts) {
        suppliesPrices[key] = counts.value * e.price;
      }).toList();
    }).toList();

    return {
      'counts': suppliesCounts,
      'prices': suppliesPrices,
    };
  }

  Map<String, Map<String, double>> get suppliesAnalysis => _suppliesAnalysis();

  static const String _reportSpacer = '\n        ';

  String _report() {
    return switch (isEnglish) {
      true => """ 
      Total Number Of Visits : ${visits.length}
      
      Visits Analysis : 
        Consultations : $numberOfConsultations
        Follow Ups : $numberOfFollowups
        Procedures : $numberOfProcedures

      Procedures Analysis :
        ${procedureAnalysis.toList().join(_reportSpacer)}

      Affiliations Analysis :
        ${affiliationAnalysis.entries.map((e) => "${e.key} = ${e.value}").toList().join(_reportSpacer)}

      Contracts Analysis :
        ${contractsAnalysis.entries.map((e) => "${e.key} = ${e.value}").toList().join(_reportSpacer)}    
      
      Supplies Analysis :
        $suppliesAnalysis

      Total Incomne : 
        $totalIncome L.E.

      Total Remaining : 
        $totalRemaining L.E.   
      """,
      false => """
      اجمالي عدد الزيارات : ${visits.length}
      
      تفاصيل الزيارات : 
        الكشوفات : $numberOfConsultations
        الاستشارات : $numberOfFollowups
        الاجرائات الطبية : $numberOfProcedures

      تفاصبل الاجرائات :
        ${procedureAnalysis.toList().join(_reportSpacer).trim()}

      تفاصيل جهات التحويل :
        ${affiliationAnalysis.entries.map((e) => "${e.key} = ${e.value}").toList().join(_reportSpacer)}

      تفاصيل العقود :
        ${contractsAnalysis.entries.map((e) => "${e.key} = ${e.value}").toList().join(_reportSpacer)}    
      
      المستلزمات :
        الاعداد : 
        ${suppliesAnalysis['counts']!.entries.map((e) => "  ${e.key} = ${e.value}").toList().join(_reportSpacer)}
        التكلفة : 
        ${suppliesAnalysis['prices']!.entries.map((e) => "  ${e.key} = ${e.value}").toList().join(_reportSpacer)}

      اجمالي الوارد : 
        $totalIncome جنيه

      اجمالي المتبقي : 
        $totalRemaining جنيه
      """,
    };
  }

  String get report => _report();
}
