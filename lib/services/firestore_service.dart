import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(Map<String, dynamic> data) async {
    await notes.add(data);
  }

  Stream<QuerySnapshot> getNotes() {
    return notes.snapshots();
  }

  Future<void> updateNote(
      String id,
      Map<String, dynamic> data,
      ) async {
    await notes.doc(id).update(data);
  }

  Future<void> deleteNote(String id) async {
    await notes.doc(id).delete();
  }
}