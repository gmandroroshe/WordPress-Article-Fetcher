import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart'; // Import Article model

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$baseUrl/wp-json/wp/v2/posts'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
