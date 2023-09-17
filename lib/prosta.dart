import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Prosta extends StatefulWidget {
  const Prosta({super.key});

  @override
  State<Prosta> createState() => _ProstaState();
}

class _ProstaState extends State<Prosta> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset("assets/animation/back.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 20),
              child: SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
