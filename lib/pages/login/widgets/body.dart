import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/router/router.gr.dart';
import 'package:plant_shop/widgets/app_logo.dart';
import 'package:plant_shop/widgets/email_text_field.dart';
import 'package:plant_shop/widgets/password_text_field.dart';
import 'package:plant_shop/widgets/social_media.dart';

import 'forgot_password_button.dart';
import 'login_button.dart';
import 'signup_button.dart';
import 'welcome_label.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            const SizedBox(height: 20),
            const WelcomeLabel(),
            const SizedBox(height: 25),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    EmailTextField(
                      emailController: _emailController,
                      onSaved: (value) => _email = value ?? '',
                    ),
                    const SizedBox(height: 20),
                    PasswordTextField(
                      passwordController: _passwordController,
                      labelText: 'Password',
                      validatorText: 'Please enter your password',
                      onSaved: (value) => _password = value ?? '',
                    ),
                    const SizedBox(height: 10),
                    ForgotPasswordButton(onPressed: _onForgotPasswordPressed),
                    const SizedBox(height: 25),
                    LoginButton(onPressed: _onLoginBtnPressed),
                    const SizedBox(height: 40),
                    const SocialMedia(),
                    const Spacer(),
                    SignUpButton(onPressed: _onSignUpBtnPressed),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Functions
  _onLoginBtnPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Email: $_email");
      print("Password: $_password");

      context.router.replace(const NavRoute());
    }
  }

  _onSignUpBtnPressed() {
    context.router.push(const SignUpRoute());
  }

  _onForgotPasswordPressed() {
    context.router.push(const ForgotPasswordRoute());
  }
}
