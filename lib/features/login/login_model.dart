import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/token_handler.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared/utils/supabase.dart';

class LoginModel {
  static Future loginEmail(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://nodejsdeployowl.et.r.appspot.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final bodyResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final session = bodyResponse['session'];
      final refreshToken = session['refresh_token'];
      await SupabaseManager.supabase.auth.setSession(refreshToken);
      await Token.setToken(session['access_token']);
    }

    return bodyResponse;
  }

  static Future<bool> loginOauth(String provider) async {
    final response = await http.post(
      Uri.parse(
          'https://nodejsdeployowl.et.r.appspot.com/oauth/$provider/mobile'),
    );

    if (response.statusCode == 200) {
      StreamController<String> controller = StreamController<String>();
      final result = jsonDecode(response.body);
      final String url = result['url'];

      await launchUrl(Uri.parse(url));

      linkStream.listen((String? link) {
        if (link != null) {
          controller.add(link);
        }
      });

      await for (String link in controller.stream) {
        int startIndex =
            link.indexOf("refresh_token=") + "refresh_token=".length;
        int endIndex = link.indexOf("&token_type");
        String refreshToken = link.substring(startIndex, endIndex).trim();

        startIndex = link.indexOf("access_token=") + "access_token=".length;
        endIndex = link.indexOf("&expires_in");
        String accessToken = link.substring(startIndex, endIndex).trim();

        Token.setToken(accessToken);
        SupabaseManager.supabase.auth.setSession(refreshToken);

        return true;
      }

      controller.close();
      return false;
    }
    return false;
  }
}
