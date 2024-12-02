import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/custom_button.dart';

class SendBtn extends StatelessWidget {
  final Function() onSendPressed;

  const SendBtn({
    super.key,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'SEND',
        onPressed: onSendPressed,
      ),
    );
  }
}
