import 'dart:convert';
import 'package:dummyjson/model/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchKasus() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/c/c967-26f7-469a-850d'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['data'];
    return data.map((json) => Datum.fromJson(json)).toList();
  } else {
    throw Exception('Gagal mengambil data koruptor');
  }
}
