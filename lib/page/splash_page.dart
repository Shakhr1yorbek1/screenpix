
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../service/auth_service.dart';
import 'Main/MainPages/HomePage.dart';
import 'Main/bottom_bar.dart';
import 'auth_pages/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {




  @override
  void initState() {
    initPage();
    super.initState();
  }

  bool isLogged = AuthService.isLoggedIn();
  Future<void> initPage() async {
    await Future.delayed(const Duration(seconds: 5),);
    isLogged = AuthService.isLoggedIn();
    if (isLogged) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
    }
  }



  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text("ScreenPix ", style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)
              .animate(delay: .250.seconds).shakeX(delay: const Duration(seconds: 1)),
        )
    );
  }
}
