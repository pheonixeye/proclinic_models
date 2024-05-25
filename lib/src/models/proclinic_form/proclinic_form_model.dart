import 'package:equatable/equatable.dart';

import 'package:proclinic_models/src/utils/object_id.dart';

class ProClinicForm extends Equatable {
  final ObjectId id;
  final String titleEn;
  final String titleAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final double length;
  final double width;
  final FormLayout formLayout;
  final List<FormDataElement> elements;

  const ProClinicForm({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    this.descriptionEn,
    this.descriptionAr,
    required this.length,
    required this.width,
    required this.formLayout,
    required this.elements,
  });

  ProClinicForm copyWith({
    ObjectId? id,
    String? titleEn,
    String? titleAr,
    String? descriptionEn,
    String? descriptionAr,
    double? length,
    double? width,
    FormLayout? formLayout,
    List<FormDataElement>? elements,
  }) {
    return ProClinicForm(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      length: length ?? this.length,
      width: width ?? this.width,
      formLayout: formLayout ?? this.formLayout,
      elements: elements ?? this.elements,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'length': length,
      'width': width,
      'formLayout': formLayout.toString(),
      'elements': elements.map((x) => x.toJson()).toList(),
    };
  }

  factory ProClinicForm.fromJson(Map<String, dynamic> map) {
    return ProClinicForm(
      id: map['_id'] as ObjectId,
      titleEn: map['titleEn'] as String,
      titleAr: map['titleAr'] as String,
      descriptionEn:
          map['descriptionEn'] != null ? map['descriptionEn'] as String : null,
      descriptionAr:
          map['descriptionAr'] != null ? map['descriptionAr'] as String : null,
      length: map['length'] as double,
      width: map['width'] as double,
      formLayout: FormLayout.fromString(map['formLayout'] as String),
      elements: List<FormDataElement>.from(
        (map['elements'] as List<Map<String, dynamic>>)
            .map<FormDataElement>((x) => FormDataElement.fromJson(x)),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      titleEn,
      titleAr,
      descriptionEn,
      descriptionAr,
      length,
      width,
      formLayout,
      elements,
    ];
  }
}

class FormDataElement extends Equatable {
  final ObjectId id;
  final String title;
  final String? description;
  final FormElement formElement;
  final bool required;
  final int startX;
  final int startY;
  final int spanX;
  final int spanY;
  final List<FormElementDataOption> options;

  const FormDataElement({
    required this.id,
    required this.title,
    this.description,
    required this.formElement,
    required this.required,
    required this.startX,
    required this.startY,
    required this.spanX,
    required this.spanY,
    required this.options,
  });

  FormDataElement copyWith({
    ObjectId? id,
    String? title,
    String? description,
    FormElement? formElement,
    bool? required,
    int? startX,
    int? startY,
    int? spanX,
    int? spanY,
    List<FormElementDataOption>? options,
  }) {
    return FormDataElement(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      formElement: formElement ?? this.formElement,
      required: required ?? this.required,
      startX: startX ?? this.startX,
      startY: startY ?? this.startY,
      spanX: spanX ?? this.spanX,
      spanY: spanY ?? this.spanY,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'description': description,
      'formElement': formElement.toString(),
      'required': required,
      'startX': startX,
      'startY': startY,
      'spanX': spanX,
      'spanY': spanY,
      'options': options.map((x) => x.toJson()).toList(),
    };
  }

  factory FormDataElement.fromJson(Map<String, dynamic> map) {
    return FormDataElement(
      id: map['_id'] as ObjectId,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      formElement: FormElement.fromString(map['formElement'] as String),
      required: map['required'] as bool,
      startX: map['startX'] as int,
      startY: map['startY'] as int,
      spanX: map['spanX'] as int,
      spanY: map['spanY'] as int,
      options: List<FormElementDataOption>.from(
        (map['options'] as List<Map<String, dynamic>>)
            .map<FormElementDataOption>(
          (x) => FormElementDataOption.fromJson(x),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      formElement,
      required,
      startX,
      startY,
      spanX,
      spanY,
      options,
    ];
  }
}

class FormElementDataOption extends Equatable {
  final ObjectId id;
  final String title;
  final String? description;
  final String value;

  const FormElementDataOption({
    required this.id,
    required this.title,
    this.description,
    required this.value,
  });

  FormElementDataOption copyWith({
    ObjectId? id,
    String? title,
    String? description,
    String? value,
  }) {
    return FormElementDataOption(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'title': title,
      'description': description,
      'value': value,
    };
  }

  factory FormElementDataOption.fromJson(Map<String, dynamic> map) {
    return FormElementDataOption(
      id: map['_id'] as ObjectId,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      value: map['value'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, description, value];
}

enum FormElement {
  textfield,
  checkbox,
  radio,
  dropdown;

  const FormElement();

  factory FormElement.fromString(String value) {
    return switch (value) {
      'textfield' => FormElement.textfield,
      'checkbox' => FormElement.checkbox,
      'radio' => FormElement.radio,
      'dropdown' => FormElement.dropdown,
      _ => throw UnimplementedError(),
    };
  }

  @override
  String toString() {
    return name.split('.').last;
  }
}

enum FormLayout {
  oneColumn,
  twoColumn,
  threeColumn,
  fourColumn,
  fiveColumn,
  sixColumn;

  const FormLayout();

  factory FormLayout.fromString(String value) {
    return switch (value) {
      'oneColumn' => FormLayout.oneColumn,
      'twoColumn' => FormLayout.twoColumn,
      'threeColumn' => FormLayout.threeColumn,
      'fourColumn' => FormLayout.fourColumn,
      'fiveColumn' => FormLayout.fiveColumn,
      'sixColumn' => FormLayout.sixColumn,
      _ => throw UnimplementedError(),
    };
  }
  @override
  String toString() {
    return name.split('.').last;
  }
}
