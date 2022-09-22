import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NormalText(text: 'Welcome Back'),
          const SizedBox(
            height: 12,
          ),
          NormalText(text: 'Login to connect with people'),
          const SizedBox(
            height: 30,
          ),
          const MyTextField(
              isPassword: false,
              obcureText: false,
              isReadOnly: false,
              labelText: 'User Name',
              keyBoardType: TextInputType.text),
                const SizedBox(
            height: 10,
          ),
           const MyTextField(
              isPassword: true,
              obcureText: true,
              isReadOnly: false,
              labelText: 'Password',
              keyBoardType: TextInputType.text),

        ],
      ),
    );
  }
}
