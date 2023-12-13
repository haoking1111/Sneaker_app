import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/toast.dart';

import '../global/common/text_field_lr.dart';
import 'forgot_pasword_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({
    super.key,
    required this.showRegisterPage
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controller
  final _emailController  = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {

    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Đăng nhập thành công, thêm thông tin người dùng vào Firestore
      // await addUserInfoToFirestore(userCredential.user!);

    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      switch (e.code) {
        case "invalid-credential":
          showToast(message: 'Wrong account or password');
        case "invalid-email":
          showToast(message: 'The email address is badly formatted');
      }
    }

    //pop loading circle
    Navigator.of(context).pop();
  }

  Future signingWithGoogle() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

       if(GoogleSignInAccount != null) {
         final GoogleSignInAuthentication? googleSignInAuthentication = await
             googleSignInAccount?.authentication;

         final AuthCredential credential = GoogleAuthProvider.credential(
           idToken: googleSignInAuthentication?.idToken,
           accessToken: googleSignInAuthentication?.accessToken,
         );

         UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

         // Đăng nhập thành công, thêm thông tin người dùng vào Firestore
         await addUserInfoToFirestore(userCredential.user!);
       }
    } catch (e) {
      print(e.toString());
      print(e);
      showToast(message: 'Error');
    }finally {
      // Close loading circle
      Navigator.of(context).pop();
    }
  }

  Future addUserInfoToFirestore(User user) async {
    // Kiểm tra xem thông tin người dùng đã tồn tại trong Firestore hay chưa
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.email)
        .get();

    // Nếu thông tin người dùng chưa tồn tại, thì thêm mới vào Firestore
    if (!userDoc.exists) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.email)
          .set({
        'username': user.email!.split('@')[0],
        'birthdate': '',
        'phonenumber': '',
        'emailaddress': user.email,
        'address' : '',
        'fullname': '',
        'city' : '',
        'provinceregion' : '',
        'zipcode' : '',
        'country' : '',
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                Image.asset('assets/images/nike.png', height: 270,),
          
                //Hello Again !!!
                Text(
                  'Hello Again !',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 54
                  ),
          
                ),
                SizedBox(height: 10,),
                Text(
                  'Welcome back, you\'ve been missed !',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700]
                  ),
                ),
          
                SizedBox(height: 30,),
          
                //email textfield
                textFieldLR(_emailController, 'Email', false),
          
                SizedBox(height: 15,),
          
                //password textfield
                textFieldLR(_passwordController, 'Password', true),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return ForgotPasswordPage();
                              },));
                        },
                        child: Text(
                            'Forgot Password?',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 10,),
          
                //sign in button
                buttonLR(() => signIn(), 'Sign In'),

                SizedBox(height: 10,),

                //sign in with gg button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signingWithGoogle,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon google
                            Icon(FontAwesomeIcons.google, color: Colors.white,),

                            SizedBox(width: 5,),

                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
          
                SizedBox(height: 20,),
          
                // not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Not a member?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                          ' Register now',
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
