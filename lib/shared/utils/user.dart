import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/supabase.dart';
import 'package:mobile/shared/utils/token_handler.dart';

class UserAccess {
  static String username = '';
  static int exp = 0;
  static int quizPoint = 0;
  static int courseComplete = 0;
  static int materialComplete = 0;
  static int quizComplete = 0;
  static int topicComplete = 0;
  static String biodata = '';
  static String image = '';
  static List achievement = [];
  static List course = [];
  static int level = 1;

  static getUser(String accessToken) async {
    final response = await http.post(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/profile"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "access_token": accessToken,
        },
      ),
    );
    final bodyResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final userProfile = bodyResponse['profile'];
      username = userProfile['user']['username'];
      exp = userProfile['user']['exp'];
      quizPoint = userProfile['user']['quiz_point'];  
      courseComplete = userProfile['user']['course_completed'];
      materialComplete = userProfile['user']['materials_completed'];
      quizComplete = userProfile['user']['materials_completed'];
      topicComplete = userProfile['user']['topic_completed'];
      biodata = userProfile['user']['biodata'];
      image = userProfile['user']['avatar'];
      achievement = userProfile['achievement'];
      course = userProfile['course'];
      level = 1 + exp ~/ 100;
    }
  }

  static userLogOut() async {
    Token.deleteToken();
    await SupabaseManager.supabase.auth.signOut();
  }
}
