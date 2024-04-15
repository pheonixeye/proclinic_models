import 'package:equatable/equatable.dart';
import 'package:proclinic_models/src/models/app_permission/app_permissions.dart';
import 'package:proclinic_models/src/utils/object_id.dart';

class Account extends Equatable {
  final ObjectId id;
  final String name;
  final String password;
  final String lastLogin;
  final bool canChangePassword;
  final List<AppPermission> permissions;

  const Account({
    required this.id,
    required this.name,
    required this.password,
    required this.lastLogin,
    required this.canChangePassword,
    required this.permissions,
  });

  Account copyWith({
    ObjectId? id,
    String? name,
    String? password,
    String? lastLogin,
    bool? canChangePassword,
    List<AppPermission>? permissions,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      lastLogin: lastLogin ?? this.lastLogin,
      canChangePassword: canChangePassword ?? this.canChangePassword,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'password': password,
      'lastLogin': lastLogin,
      'canChangePassword': canChangePassword,
      'permissions': permissions.map((x) => x.toString()).toList(),
    };
  }

  factory Account.fromJson(Map<String, dynamic> map) {
    return Account(
      id: map['_id'] as ObjectId,
      name: map['name'] as String,
      password: map['password'] as String,
      lastLogin: map['lastLogin'] as String,
      canChangePassword: map['canChangePassword'] as bool,
      permissions: List<AppPermission>.from(
        (map['permissions'] as List<dynamic>).map<AppPermission>(
          (x) => AppPermission.fromString(x),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      password,
      lastLogin,
      canChangePassword,
      permissions,
    ];
  }

  factory Account.create({
    required String name,
    required String password,
  }) {
    return Account(
      id: ObjectId(),
      name: name,
      password: password,
      lastLogin: DateTime.now().toIso8601String(),
      canChangePassword: false,
      permissions: [],
    );
  }

  bool isAuthorized(AppPermission permission) {
    if (permissions.contains(permission)) {
      return true;
    }
    return false;
  }
}
