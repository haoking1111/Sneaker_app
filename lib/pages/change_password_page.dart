import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/text_field.dart';
import 'package:sneaker_app/global/common/toast.dart';
import 'package:sneaker_app/pages/login_page.dart';

class ChangPassWordPage extends StatefulWidget {
  const ChangPassWordPage({super.key});

  @override
  State<ChangPassWordPage> createState() => _ChangPassWordPageState();
}

class _ChangPassWordPageState extends State<ChangPassWordPage> {
  //currentPassword
  final _currentPasswordController = TextEditingController();

  //newPassWord
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  //changePassword
  changePassword({email, currentPassword, newPassword}) async {
    try {
      // Kiểm tra xem mật khẩu hiện tại có chính xác không trước khi đăng nhập lại
      var cred = EmailAuthProvider.credential(email: email, password: currentPassword);
      await currentUser!.reauthenticateWithCredential(cred);

      // Nếu mật khẩu hiện tại chính xác, thì mới cập nhật mật khẩu mới
      await currentUser!.updatePassword(newPassword);

      showToast(message: 'Password changed... Login again!');

      // Sau khi cập nhật mật khẩu mới, đăng xuất
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);

    }catch (e) {
      print('${e}');
      showToast(message: 'Current password is incorrect!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Icon(
              Icons.lock,
              size: 120,
            ),

            //currentPassword textfield
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: textFieldLR(_currentPasswordController, 'Current Password', true),
            ),

            SizedBox(
              height: 15,
            ),

            //newPassword textfield
            textFieldLR(_newPasswordController, 'New Password', true),

            SizedBox(
              height: 15,
            ),

            //button change
            GestureDetector(
              onTap:() async {
                await changePassword (
                    email: currentUser!.email,
                    currentPassword: _currentPasswordController.text.trim(),
                    newPassword: _newPasswordController.text.trim()
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                        child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
