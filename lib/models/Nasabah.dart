import 'dart:convert';

class Nasabah {
  final int id;
  final String nama_debitur;
  final String alamat;
  final String no_telp;
  final String no_ktp;
  final String no_selular;

  Nasabah(
      {this.id = 0,
      required this.nama_debitur,
      required this.alamat,
      required this.no_telp,
      required this.no_ktp,
      required this.no_selular});

  factory Nasabah.fromJson(Map<String, dynamic> json) {
    return Nasabah(
      id: json['id'],
      nama_debitur: json['nama_debitur'],
      alamat: json['alamat'],
      no_telp: json['no_telp'],
      no_ktp: json['no_ktp'],
      no_selular: json['no_selular'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_debitur': nama_debitur,
      'alamat': alamat,
      'no_telp': no_telp,
      'no_ktp': no_ktp,
      'no_selular': no_selular,
    };
  }

  @override
  String toString() {
    return 'Nasabah{id: $id, nama_debitur: $nama_debitur, alamat: $alamat, no_telp: $no_telp, no_ktp: $no_ktp, no_selular: $no_selular}';
  }
}

String nasabahToJson(Nasabah nasabah) {
  final jsonData = nasabah.toJson();
  return json.encode(jsonData);
}
