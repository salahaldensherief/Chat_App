import 'package:chat_app/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widgets/Costem_TextField.dart';
import '../Widgets/custem_botton.dart';
import '../helper/show_snake_bar.dart';

class registerScreen extends StatefulWidget {
  registerScreen({super.key});
  static String id = 'registerScreen';

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: Color(0xff2B475E),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico'),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustemTextFormField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email'),
                    SizedBox(
                      height: 12,
                    ),
                    CustemTextFormField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password'),
                    SizedBox(
                      height: 20,
                    ),
                    CustemBotton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registerUser();
                            Navigator.pushNamed(context, ChatPage.id);
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak password') {
                              showSnackBar(context, 'weak password');
                            } else if (ex.code == 'email-already-in-use') {
                              showSnackBar(context, 'email already exists');
                            }
                          } catch (ex) {
                            showSnackBar(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {});
                        } else {}
                      },
                      bottontxt: 'REGISTER',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'you have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: Text(
                            ' Login',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }



  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
