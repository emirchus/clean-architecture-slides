List<String> kAbstractionCodes = const [
  """
import 'package:flutter_counter_app/domain/enums/operations.dart';

abstract class Operation<T> {
  OperationType get type;

  T execute();

  @override
  String toString() {
    return type.toString();
  }
}

""",
  """
import 'package:app/core/abstracts/dto.dart';
import 'package:app/core/entities/user.dart';

class UserDto extends DTO<User>{
  UserDto(super.status, super.message, {super.data});
}
""",
  """
import 'package:flutter_counter_app/domain/abstracts/operation.dart';
import 'package:flutter_counter_app/domain/entities/operation_result.dart';

abstract class OperationsRepository {
  void addOperation(Operation operation);

  List<Operation> getOperations();

  void addResult(OperationResult result);

  List<OperationResult> getResults();

  void clearResults();

  void clearOperations();
}
""",
  """
enum SignInType {
  google,
  facebook,
  apple,
  email,
}
""",
  """
import 'package:app/core/abstracts/entity.dart';

class User extends Entity {
  final String name;
  final String email;

  User({required super.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
"""
];
