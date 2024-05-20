import 'package:flutter/material.dart';
import 'package:mobile/shared/utils/supabase.dart';
import 'package:mobile/shared/utils/token_handler.dart';
import 'package:mobile/shared/utils/user.dart';
import '../../shared/widgets/background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectPage();
  }

  Future<void> redirectPage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) {
      return;
    }

    final nav = Navigator.of(context);
    final jwt = await Token.getToken();
    try {
      await SupabaseManager.supabase.auth.getUser(jwt);
      UserAccess.getUser(jwt!).then((_) {
        nav.pushReplacementNamed('/main');
      });
    } catch (e) {
      nav.pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: BackgroundColor(
        main: Center(
          child: Image.asset(
            'assets/splash.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
        splash: true,
      ),
    );
  }
}
