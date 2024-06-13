import 'package:proclinic_models/proclinic_models.dart';

class FormHolder {
  const FormHolder({this.formId, this.formData});

  final ObjectId? formId;
  final Map<String, dynamic>? formData;
}
