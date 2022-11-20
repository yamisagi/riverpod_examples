import 'package:flutter/material.dart';
import 'package:riverpod_examples/person_list_app/person_model.dart';

Future<Person?> createOrUpdatePerson({
  required BuildContext context,
  Person? person,
  required TextEditingController nameController,
  required TextEditingController ageController,
}) async {
  String? name = person?.name;
  int? age = person?.age;

  return showDialog<Person?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(person == null ? 'Add Person' : 'Update Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) => name = value,
              controller: nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) => age = int.tryParse(value),
              controller: ageController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (name != null && age != null) {
                if (person != null) {
                  final newPerson = person.copyWith(name: name, age: age);
                  Navigator.pop(context, newPerson);
                  
                } else {
                  Navigator.pop(context, Person(name: name!, age: age!));
                }
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
