import 'package:dash/utils/imports.dart';
import 'package:dash/view/navbar_page.dart';

import 'features/authentication/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  Future<void> _checkUser() async {
    UserModel? userModel = await LocalDatabase.getCurrentUser();
    if (userModel?.id != null || userModel?.token != null) {
      goToHome();
    } else {
      goToAuthPage();
    }
  }

  Future<void> _initTimer() async {
    Timer(const Duration(seconds: 2), _checkUser);
  }

  goToHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (c) => const NavBarPage()),
      (route) => false,
    );
  }

  goToLogIn() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (c) => const LogInPage()),
      (route) => false,
    );
  }

  goToAuthPage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (c) => const AuthPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Splash",
      child: Scaffold(
        body: Image.asset(
          DashAssets.logo,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
