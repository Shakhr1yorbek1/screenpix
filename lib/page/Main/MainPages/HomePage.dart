import 'package:flutter/material.dart';

import '../../../service/auth_service.dart';
import '../../auth_pages/signin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()async{
            await AuthService.signOutUser();
            await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInPage()));
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
