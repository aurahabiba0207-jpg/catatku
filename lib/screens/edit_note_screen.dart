import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class EditNoteScreen extends StatelessWidget {
  final String docId;
  final Map<String, dynamic> note;

  EditNoteScreen({
    super.key,
    required this.docId,
    required this.note,
  });

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final judulController =
        TextEditingController(text: note['judul']);

    final isiController =
        TextEditingController(text: note['isi_catatan']);

    final mkController =
        TextEditingController(text: note['mata_kuliah']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                labelText: "Judul",
              ),
            ),

            TextField(
              controller: isiController,
              decoration: const InputDecoration(
                labelText: "Isi Catatan",
              ),
            ),

            TextField(
              controller: mkController,
              decoration: const InputDecoration(
                labelText: "Mata Kuliah",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await firestoreService.updateNote(
                  docId,
                  {
                    'judul': judulController.text,
                    'isi_catatan': isiController.text,
                    'mata_kuliah': mkController.text,
                  },
                );

                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}