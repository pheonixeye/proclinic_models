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

  factory ProClinicForm.create({
    required String titleEn,
    required String titleAr,
    required double length,
    required double width,
    required FormLayout formLayout,
    String? descriptionEn,
    String? descriptionAr,
  }) {
    return ProClinicForm(
      id: ObjectId(),
      titleEn: titleEn,
      titleAr: titleAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      length: length,
      width: width,
      formLayout: formLayout,
      elements: [],
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
        (map['elements'] as List<dynamic>)
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
  final double startX;
  final double startY;
  final double spanX;
  final double spanY;
  final List<FormElementDataOption> options;
  final ObjectId? image;

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
    this.image,
  });

  FormDataElement copyWith({
    ObjectId? id,
    String? title,
    String? description,
    FormElement? formElement,
    bool? required,
    double? startX,
    double? startY,
    double? spanX,
    double? spanY,
    List<FormElementDataOption>? options,
    ObjectId? image,
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
      image: image ?? this.image,
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
      'image': image,
    };
  }

  factory FormDataElement.create({
    required String title,
    String? description,
    required FormElement formElement,
    required double startX,
    required double startY,
    double spanX = 250,
    double spanY = 100,
  }) {
    return FormDataElement(
      id: ObjectId(),
      title: title,
      description: description,
      formElement: formElement,
      required: false,
      startX: startX,
      startY: startY,
      spanX: spanX,
      spanY: spanY,
      options: const [],
      image: null,
    );
  }

  factory FormDataElement.fromJson(Map<String, dynamic> map) {
    return FormDataElement(
      id: map['_id'] as ObjectId,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      formElement: FormElement.fromString(map['formElement'] as String),
      required: map['required'] as bool,
      startX: map['startX'] as double,
      startY: map['startY'] as double,
      spanX: map['spanX'] as double,
      spanY: map['spanY'] as double,
      options: List<FormElementDataOption>.from(
        (map['options'] as List<Map<String, dynamic>>)
            .map<FormElementDataOption>(
          (x) => FormElementDataOption.fromJson(x),
        ),
      ),
      image: map['image'] as ObjectId,
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
      image,
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
  dropdown,
  image,
  text;

  const FormElement();

  factory FormElement.fromString(String value) {
    return switch (value) {
      'textfield' => FormElement.textfield,
      'checkbox' => FormElement.checkbox,
      'radio' => FormElement.radio,
      'dropdown' => FormElement.dropdown,
      'text' => FormElement.text,
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

  int get columns => switch (this) {
        FormLayout.oneColumn => 1,
        FormLayout.twoColumn => 2,
        FormLayout.threeColumn => 3,
        FormLayout.fourColumn => 4,
        FormLayout.fiveColumn => 5,
        FormLayout.sixColumn => 6,
      };
  @override
  String toString() {
    return name.split('.').last;
  }
}
