import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../page/auth_pages/signup_page.dart';
import 'app_collors.dart';

class ContainerPG extends StatelessWidget {
  dynamic controllerr;
  String name;
  bool obscure;
  double thewidh;
  double theheid;


  ContainerPG({
    required this.controllerr,
    required this.name,
    required this.obscure,
    required this.theheid,
    required this.thewidh,

      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: thewidh,
      height: theheid,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child:ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 10),
          child:  TextField(
            controller: controllerr,
            obscureText: obscure,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: name,
              border: InputBorder.none,
              hintStyle: const TextStyle(fontSize: 17, color: AppColors.LoginText),
            ),
          ),

        ),
      )
    );
  }
}

class FrossedGlassedBox extends StatelessWidget {
  final containerwith;
  void  doSignIn;
  final theheight;
  final thewith;
  final child;

   FrossedGlassedBox({required this.child,required this.doSignIn, required this.theheight,required this.thewith,required this.containerwith ,super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 40,right: 40),
      width: screenSize.width,
      height: containerwith,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1,sigmaY: 0.9),
          child: Container(
            height: theheight,
            width: thewith,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white60,Colors.white10]
              ),
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2, color: Colors.white30),

            ),
            child:child,
          ),
        ),
      ),
    );
  }
}


