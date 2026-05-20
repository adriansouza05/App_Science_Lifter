import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final String _endpoint = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchExternalData() async {
    try {
      final response = await http
          .get(Uri.parse(_endpoint))
          .timeout(const Duration(seconds: 12));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception("Erro de servidor: Código ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Falha na conexão de rede ou limite de tempo esgotado.");
    }
  }
}
