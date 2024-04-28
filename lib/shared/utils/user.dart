import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/supabase.dart';
import 'package:mobile/shared/utils/token_handler.dart';

class UserAccess {
  static String username = '';

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
      username = bodyResponse['profile'][0]['username'];
    }
  }

  static userLogOut() async {
    Token.deleteToken();
    await SupabaseManager.supabase.auth.signOut();
  }
}
