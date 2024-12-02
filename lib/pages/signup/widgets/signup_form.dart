import 'package:flutter/material.dart';
import 'package:plant_shop/pages/home/home_page.dart';
import 'package:plant_shop/widgets/custom_button.dart';
import 'package:plant_shop/widgets/email_text_field.dart';
import 'package:plant_shop/widgets/password_text_field.dart';
import 'package:plant_shop/widgets/social_media.dart';

import 'login_button.dart';
import 'terms_and_conditions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _newPassword = '';
  bool _termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameField(),
          const SizedBox(height: 20),
          buildLastNameField(),
          const SizedBox(height: 20),
          buildEmailField(),
          const SizedBox(height: 20),
          buildPasswordField(),
          const SizedBox(height: 20),
          buildNewPasswordField(),
          const SizedBox(height: 20),
          TermsAndCoditions(
            checkboxValue: _termsAndConditions,
            onPressed: _onTermsAndConditionsPressed,
          ),
          const SizedBox(height: 25),
          buildSignUpButton(),
          const SizedBox(height: 20),
          const SocialMedia(),
          const SizedBox(height: 40),
          LogInButton(onPressed: _oLogInButtonPressed),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      controller: _firstnameController,
      onSaved: (value) => _firstname = value ?? '',
      decoration: const InputDecoration(
        labelText: 'First Name',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your first name';
        }
        return null;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      controller: _lastnameController,
      onSaved: (value) => _lastname = value ?? '',
      decoration: const InputDecoration(
        labelText: 'Last Name',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your last name';
        }
        return null;
      },
    );
  }

  Widget buildEmailField() {
    return EmailTextField(
      emailController: _emailController,
      onSaved: (value) => _email = value ?? '',
    );
  }

  Widget buildPasswordField() {
    return PasswordTextField(
      passwordController: _passwordController,
      labelText: 'Password',
      validatorText: 'Please enter your password',
      onChanged: (value) => _password = value ?? '',
    );
  }

  Widget buildNewPasswordField() {
    return PasswordTextField(
      passwordController: _newPasswordController,
      labelText: 'New Password',
      validatorText: 'Please enter your password',
      validator: (_) {
        print("$_password: $_newPassword");
        if (_password != _newPassword) {
          return "Password doesn't match";
        }

        return null;
      },
      onChanged: (value) => _newPassword = value ?? '',
    );
  }

  Widget buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Register',
        onPressed: _onSignUpButtonPressed,
      ),
    );
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  // Functions
  void _onSignUpButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("First Name: $_firstname");
      print("Last Name: $_lastname");
      print("Email: $_email");
      print("Password: $_password");
      print("NewPassword: $_newPassword");

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  _onTermsAndConditionsPressed(bool value) {
    setState(() {
      _termsAndConditions = value;
    });
  }

  _oLogInButtonPressed() {
    Navigator.of(context).pop();
  }
}
