class Note {
  String id;
  String judul;
  String isiCatatan;
  String mataKuliah;

  Note({
    required this.id,
    required this.judul,
    required this.isiCatatan,
    required this.mataKuliah,
  });

  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'isi_catatan': isiCatatan,
      'mata_kuliah': mataKuliah,
    };
  }
}