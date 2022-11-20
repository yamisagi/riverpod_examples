import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String id;

  Person({
    required this.name,
    required this.age,
    String? id,
  }) : id = id ?? const Uuid().v4();

  Person copyWith({String? name, int? age}) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      id: id,
    );
  }

  String get displayName => '$name ($age)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Person{name: $name, age: $age, id: $id}';
  }
}
