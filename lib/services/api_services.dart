import 'dart:convert';

import 'package:fleetime/models/Nasabah.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://fleetime.herokuapp.com/api';

  // Get Nasabah
  Future<List<Nasabah>> getNasabah() async {
    final response = await http
        .get(Uri.parse('$apiUrl/mstdebitur'))
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception('Timeout');
    });

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Nasabah> nasabah =
          body.map((dynamic item) => Nasabah.fromJson(item)).toList();
      return nasabah;
    } else {
      throw Exception('Failed to load nasabah list');
    }
  }

  // Get Nasabah by id
  Future<Nasabah> getNasabahById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/mstdebitur/$id'));

    if (response.statusCode == 200) {
      Nasabah nasabah = Nasabah.fromJson(jsonDecode(response.body));
      return nasabah;
    } else {
      throw Exception('Failed to load nasabah');
    }
  }

  // Create Nasabah
  Future<Nasabah> createNasabah(Nasabah nasabah) async {
    Map data = {
      'nama_debitur': nasabah.nama_debitur,
      'alamat': nasabah.alamat,
      'no_telp': nasabah.no_telp,
      'no_ktp': nasabah.no_ktp,
      'no_selular': nasabah.no_selular
    };

    final response = await http.post(Uri.parse('$apiUrl/mstdebitur'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Nasabah.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create nasabah');
    }
  }

  // Edit Nasabah by id
  Future<Nasabah> editNasabah(int id, Nasabah nasabah) async {
    Map data = {
      'nama_debitur': nasabah.nama_debitur,
      'alamat': nasabah.alamat,
      'no_telp': nasabah.no_telp,
      'no_ktp': nasabah.no_ktp,
      'no_selular': nasabah.no_selular
    };

    final response = await http.put(Uri.parse('$apiUrl/mstdebitur/$id'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return Nasabah.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to edit nasabah');
    }
  }

  Future<bool> updateNasabah(int id, Nasabah data) async {
    final response = await http.put(Uri.parse('$apiUrl/mstdebitur/${id}'),
        headers: {'Content-Type': 'application/json'},
        body: nasabahToJson(data));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update nasabah');
    }
  }

  // Delete Nasabah
  Future<void> deleteNasabah(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/mstdebitur/$id'));

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete nasabah');
    }
  }
}
