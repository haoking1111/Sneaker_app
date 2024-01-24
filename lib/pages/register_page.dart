import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/text_field_lr.dart';
import 'package:sneaker_app/global/common/toast.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({
    super.key,
    required this.showLoginPage
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controller
  final _emailController  = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (!mounted) return;
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );

    try {
      //create user
      if (passwordConfirm()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // add user details
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.email)
            .set({
              'username' : _emailController.text.split('@')[0],
              'birthdate' : '',
              'phonenumber' : '',
              'emailaddress' : _emailController.text.trim(),
              'address' : '',
              'fullname': '',
              'city' : '',
              'provinceregion' : '',
              'zipcode' : '',
              'country' : '',
            });

        // show success message
        showToast(message: 'Sign Up Success');

      } else {
        showToast(message: 'Confirm password was wrong!');
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      switch (e.code) {
        case 'email-already-in-use':
          showToast(message: 'The email address is already in use by another account');
          break;
        case 'invalid-email':
          showToast(message: 'Your email address appears to be incorrect');
          break;
      }
    }

    // pop loading circle
    Navigator.of(context).pop();
  }

  bool passwordConfirm() {
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Logo nike
                Image.asset('assets/images/nike.png', height: 270),

                //Hello Again !!!
                Text(
                  'Hello There !',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 54
                  ),

                ),
                const SizedBox(height: 10,),
                Text(
                  'Register below with your details !',
                  style: TextStyle(
                    fontSize: 20, color: Colors.grey[700]
                  ),
                ),

                const SizedBox(height: 30,),

                //email textfield
                textFieldLR(_emailController, 'Email', false),

                const SizedBox(height: 15,),

                //password textfield
                textFieldLR(_passwordController, 'Password', true),

                const SizedBox(height: 15,),

                //confirm password textfield
                textFieldLR(_confirmPasswordController, 'Confirm Password', true),

                const SizedBox(height: 15,),

                //sign up button
                buttonLR(() => signUp(), 'Sign Up'),

                const SizedBox(height: 20,),

                // not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have account?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Login now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
