import 'package:http/http.dart' as http;
import 'package:quiz/Model/Quizmodel.dart';

Future<List<Quiz>> fetchQuiz() async {
  final response = await http
      .get(Uri.parse('https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return  quizFromJson((response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Quiz');
  }
}
