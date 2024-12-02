import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/app_logo.dart';
import 'package:plant_shop/widgets/email_text_field.dart';

import 'description_label.dart';
import 'forgot_password_header.dart';
import 'send_btn.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const ForgotPasswordHeader(),
                    const SizedBox(height: 20),
                    const DescriptionLabel(),
                    const SizedBox(height: 20),
                    EmailTextField(
                      emailController: _emailController,
                      onSaved: (value) => _email = value ?? '',
                    ),
                    const SizedBox(height: 40),
                    SendBtn(onSendPressed: onSendPressed),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Functions
  void onSendPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Send email to $_email");
    }
  }
}
