import 'package:flutter/material.dart';
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

    final jwt = await Token.getToken();
    if (jwt != null) {
      UserAccess.getUser(jwt).then((_) {
        Navigator.of(context).pushReplacementNamed('/main');
      });
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
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
