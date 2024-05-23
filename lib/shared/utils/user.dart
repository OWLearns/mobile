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
  static List completedCourse = [];
  static List ongoingCourse = [];
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
    completedCourse = userProfile['completedCourse'];
    level = 1 + exp ~/ 100;

    final courseResponse = await http.post(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/getStudied"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "access_token": accessToken,
        },
      ),
    );

    final bodyCourseResponse = jsonDecode(courseResponse.body)['data'];
    ongoingCourse = bodyCourseResponse.entries.map((entry) {
      return {
        'name': entry.key,
        ...entry.value,
      };
    }).toList();
  }

  static userLogOut() async {
    Token.deleteToken();
    await SupabaseManager.supabase.auth.signOut();
  }

  static editUser(String editUsername, String editBioData, jwt) async {
    final response = await http.patch(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/editProfile"),
      body: {
        "username": editUsername,
        "biodata": editBioData,
        "access_token": jwt,
      },
    );

    print(response.statusCode);
    print(response.body);
  }
}
