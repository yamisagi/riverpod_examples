import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/person_list_app/data_model.dart';
import 'package:riverpod_examples/person_list_app/util.dart';

class PersonList extends ConsumerStatefulWidget {
  const PersonList({super.key});

  @override
  ConsumerState<PersonList> createState() => _PersonListState();
}

class _PersonListState extends ConsumerState<PersonList> {
  late final TextEditingController textController;
  late final TextEditingController ageController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final dataModel = ref.watch(personProvider);
          return ListView.builder(
            itemCount: dataModel.peopleCount,
            itemBuilder: (context, index) {
              final person = dataModel.people[index];
              return ListTile(
                title: Text(person.name),
                subtitle: Text(person.age.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref.read(personProvider).removePerson(person);
                  },
                ),
                onTap: () async {
                  final updatedPerson = await createOrUpdatePerson(
                    context: context,
                    person: person,
                    nameController: textController,
                    ageController: ageController,
                  );
                  if (updatedPerson != null) {
                    dataModel.updatePerson(updatedPerson);
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newPerson = await createOrUpdatePerson(
            context: context,
            nameController: textController,
            ageController: ageController,
          );
          if (newPerson != null) {
            final dataModel = ref.read(personProvider);
            dataModel.addPerson(newPerson);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
