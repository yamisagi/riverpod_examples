import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/person_list_app/person_model.dart';

final personProvider = ChangeNotifierProvider((_) => DataModel());

class DataModel extends ChangeNotifier {
  final List<Person> _people = [];
  int get peopleCount => _people.length;

  UnmodifiableListView<Person> get people => UnmodifiableListView(_people);

  void addPerson(Person person) {
    _people.add(person);
    notifyListeners();
  }

  void removePerson(Person person) {
    _people.remove(person);
    notifyListeners();
  }

  void updatePerson(Person newPerson) {
    final index = _people.indexWhere((person) => person.id == newPerson.id);
    _people[index] = newPerson;
    notifyListeners();
  }
}
