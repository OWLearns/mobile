import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/supabase.dart';
import 'package:mobile/shared/utils/token_handler.dart';

class UserAccess {
  static String username = '';
  static String level = '0';
  static String quizPoint = '0';
  static String courseComplete = '0';
  static String materialComplete = '0';
  static String quizComplete = '0';
  static String topicComplete = '0';

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
    print(bodyResponse['profile'][0]);
    if (response.statusCode == 200) {
      // final userProfile = bodyResponse['profile'][0];
      // username = userProfile['username'];
      // level = userProfile['level'];
      // quizPoint = userProfile['quiz_point'];
      // courseComplete = userProfile['course_completed'];
      // materialComplete = userProfile['materials_completed'];
      // quizComplete = userProfile['materials_completed'];
      // topicComplete = userProfile['topic_completed'];
    }
  }

  static userLogOut() async {
    Token.deleteToken();
    await SupabaseManager.supabase.auth.signOut();
  }
}
