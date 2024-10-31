import 'dart:ffi';

import 'package:chat_app/Widgets/Costem_TextField.dart';
import 'package:chat_app/Widgets/custem_botton.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/resgister_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snake_bar.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});
static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   GlobalKey<FormState> formKey = GlobalKey();
   String? email,password;


  bool isLoading = false;

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
                    Spacer(flex: 2,),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico'),
                    ),
                   Spacer(flex: 2,),
                    Row(
                      children: [
                        Text(
                          'LOG IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    CustemTextFormField(
                        onChanged: (data){
                          email = data;
                        },
                        hintText: 'Email'),
                    SizedBox(
                      height: 12,
                    ),
                    CustemTextFormField(
                      obscureText: true,
                        onChanged: (data){
                          password = data;
                        },
                        hintText: 'Password'),
                    SizedBox(height: 20,),
                    CustemBotton(bottontxt: 'LOGIN',
                    onTap: ()async{
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {

                        });
                        try {
                          await loginUser();
                         Navigator.pushNamed(context, ChatPage.id,arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(context, 'user not found');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context, 'wrong password');
                          }
                        }catch(ex){
                          print(ex);
                          showSnackBar(context, 'there was an error');

                        }
                        isLoading =false;
                        setState(() {

                        });

                      }else{

                      }
                    },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'don\'t have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, registerScreen.id);
                            },

                          child: Text(
                            ' Register',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(flex: 3,),
                  ],
                ),
              ),
            ),
          )),
    );
  }
   Future<void> loginUser() async {
     UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
   }
}
