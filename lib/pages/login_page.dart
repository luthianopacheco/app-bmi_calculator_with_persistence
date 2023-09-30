import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Center(child: Text('welcome to', style: GoogleFonts.kanit())),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'BMI',
                        style: GoogleFonts.kanit(fontSize: 70),
                      ),
                      TextSpan(
                          text: ' Calculator',
                          style: GoogleFonts.kanit(fontSize: 26))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //TODO: All the functionality of this page
              _buildTextFormField(iconType: Icons.person_outline, hint: 'user'),
              _buildTextFormField(
                iconType: Icons.lock_outline,
                hint: 'password',
                obscure: true,
                suffixButton: _buildSuffixIconButton(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: SizedBox(
                  height: 35,
                  child: FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff0ABF06))),
                      onPressed: () {
                        Get.toNamed('navigationPage');
                      },
                      child: const Text('Sign In')),
                ),
              ),
              const SizedBox(height: 30),
              _buildSignInButton(
                  textButton: 'GOOGLE',
                  iconType: Image.asset(
                    'assets/images/icon-google.png',
                    height: 20,
                    width: 20,
                  )),
              const SizedBox(height: 10),
              _buildSignInButton(
                  textButton: 'FACEBOOK', iconType: const Icon(Icons.facebook)),
              const SizedBox(height: 10),
              _buildSignInButton(
                  textButton: 'APPLE', iconType: const Icon(Icons.apple)),
              const SizedBox(height: 10),
              _buildTextButton(buttonText: 'Trouble Signing In? Touch here.'),
              _buildTextButton(buttonText: 'Sign up? Touch here.'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _buildSignInButton({required String textButton, required Widget iconType}) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        onPressed: () {
          Get.toNamed('navigationPage');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconType,
            Text(
              'SIGN IN WITH $textButton',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildTextButton({required String buttonText}) {
    return TextButton(
      onPressed: () {
        Get.toNamed('navigationPage');
      },
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildTextFormField(
      {required IconData iconType,
      required String hint,
      bool obscure = false,
      Widget suffixButton = const Text('')}) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: TextFormField(
        obscureText: obscure ? isObscureText : false,
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(iconType),
          suffix: suffixButton,
        ),
      ),
    );
  }

  _buildSuffixIconButton() {
    return IconButton(
      onPressed: () {
        isObscureText = !isObscureText;
        setState(() {});
      },
      icon: Icon(isObscureText
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined),
    );
  }
}
