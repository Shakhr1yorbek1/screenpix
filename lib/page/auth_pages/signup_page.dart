import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:screenpix/page/auth_pages/signin_page.dart';
import '../../Companents/app_collors.dart';
import '../../Companents/container_style.dart';
import '../../service/auth_service.dart';
import '../Main/MainPages/HomePage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController CpasswordController = TextEditingController();

  void doSignUp() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String cPassword = CpasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) return;

    if (password != cPassword) return;

    AuthService.signUpUser(email, password).then((value) => {
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
        body: SingleChildScrollView(
          child: Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/lll.jpg",
                      ),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      RiveAnimation.asset(
                        "assets/animation/back.riv",
                        fit: BoxFit.fill,
                      ),
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
                      Container(
                        margin: EdgeInsets.only(left: 40, right: 40),
                        width: screenSize.width,
                        height: screenSize.height*0.550,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 0.9),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(width: 2, color: Colors.white30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Gender"),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 19,
                                          ),
                                          Text("Female")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 19,
                                          ),
                                          Text("Female")
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerPG(
                                    theheid: 60,
                                    thewidh: 280,
                                    controllerr: nameController,
                                    name: "Name",
                                    obscure: false,
                                  ).animate(delay: .250.seconds).slideX(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerPG(
                                    theheid: 60,
                                    thewidh: 280,
                                    controllerr: emailController,
                                    name: "Email",
                                    obscure: false,
                                  ).animate(delay: .250.seconds).slideX(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerPG(
                                    theheid: 60,
                                    thewidh: 280,
                                    controllerr: passwordController,
                                    name: "Password",
                                    obscure: true,
                                  ).animate(delay: .250.seconds).slideX(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerPG(
                                    theheid: 60,
                                    thewidh: 280,
                                    controllerr: CpasswordController,
                                    name: "Conform password",
                                    obscure: true,
                                  ).animate(delay: .250.seconds).slideX(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignInPage()));
                                          },
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                                color: AppColors.LoginContainer,
                                                fontSize: 18),
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                          doSignUp();
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: AppColors.Text,
                                              fontSize: 28),
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
              )),
        ));
  }
}
