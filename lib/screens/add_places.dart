import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/provider/user_places.dart';

class AddNewPlaces extends ConsumerStatefulWidget {
  const AddNewPlaces({super.key});

  @override
  ConsumerState<AddNewPlaces> createState() => _AddNewPlacesState();
}

class _AddNewPlacesState extends ConsumerState<AddNewPlaces> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Place')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            SizedBox(height: 16),
            ImageInput(),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _savePlace, child: Text('Add Place')),
          ],
        ),
      ),
    );
  }
}
