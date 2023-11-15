import 'package:flutter/material.dart';
import 'package:product_list/models/note_models.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                controller: titleController,
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Title")),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: bodyController,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "note")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }

          final note = Note(
            body: bodyController.text,
            title: titleController.text,
          );

          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
