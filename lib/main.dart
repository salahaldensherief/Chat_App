import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_Screen.dart';
import 'package:chat_app/screens/resgister_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
     LoginScreen.id: (context) => LoginScreen(),
        registerScreen.id: (context) => registerScreen(),
        ChatPage.id : (context) => ChatPage(),
      },
     initialRoute:LoginScreen.id,
    );
  }
}
