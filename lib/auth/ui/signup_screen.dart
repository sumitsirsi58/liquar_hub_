import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquar_hub/const/color_const.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignUpScreen> {
  bool passwordVisible = false;
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorConst.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  ColorConst.TextFilledColor
              ),
              child: TextFormField(
                controller: emailControler,
                cursorColor: Colors.white70,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConst.TextFilledColor
              ),
              child: TextFormField(
                controller: passwordControler,
                cursorColor: Colors.black,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFDCC4A1)),
              child: const Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(height: 12),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'LogIn',
                    style: TextStyle(color: Color(0xFFDCC4A1)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
