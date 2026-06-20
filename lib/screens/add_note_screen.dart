import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final judulController = TextEditingController();
  final isiController = TextEditingController();
  final mkController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Catatan"),
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
                await firestoreService.addNote({
                  'judul': judulController.text,
                  'isi_catatan': isiController.text,
                  'mata_kuliah': mkController.text,
                  'tanggal_dibuat': DateTime.now(),
                });

                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}