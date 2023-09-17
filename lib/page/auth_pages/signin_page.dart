import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:screenpix/page/auth_pages/signup_page.dart';

import '../../Companents/app_collors.dart';
import '../../Companents/container_style.dart';

import '../../service/auth_service.dart';
import '../Main/MainPages/HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void doSignIn() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) return;

    AuthService.signInUser(email, password).then((value) => {
          if (value != null)
            {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body:SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child : Stack(
            children: [
              Stack(
                children: [
                  RiveAnimation.asset("assets/animation/back.riv",fit: BoxFit.fill),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 10, sigmaX: 20),
                      child: SizedBox(),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: screenSize.width,
                    height: 70,
                    child: Column(
                      children: [
                        const Text(
                          "WELCOME!",
                          style: TextStyle(
                              fontSize: 28, color: AppColors.Text),
                        ).animate().fade(delay: 500.ms).slideY(),
                        const Text(
                          "Please login to continue!",
                          style: TextStyle(
                              fontSize: 28, color: AppColors.Text),
                        ).animate().fade(delay: 500.ms).slideY()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: Center(
                        child: const Image(
                          image: AssetImage("assets/images/SP.png"),
                        ).animate(delay: .250.seconds).slideX()),
                  ),
                  ///GlassedContainer
                  const SizedBox(
                      height: 10
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40,right: 40),
                    width: screenSize.width,
                    height: screenSize.height*0.450,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1,sigmaY: 0.9),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 2, color: Colors.white30),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContainerPG(
                                theheid: 65,
                                thewidh: 300,
                                obscure: false,
                                controllerr: emailController,
                                name: "Email",
                              ).animate(delay: .250.seconds).slideX(),
                              const SizedBox(
                                height: 28,
                              ),
                              ContainerPG(
                                theheid: 65,
                                thewidh: 300,

                                obscure: true,
                                controllerr: passwordController,
                                name: "Password",
                              ).animate(delay: .250.seconds).slideX(),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const SignupPage()));
                                      },
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.black87, fontSize: 18),
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                              Container(
                                width: 200,
                                height: 60,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColors.LoginButton,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      doSignIn();
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(color: AppColors.Text, fontSize: 28),
                                    )),
                              ).animate(delay: .250.seconds).slideX(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )

        ),
      ),
    );
  }
}
