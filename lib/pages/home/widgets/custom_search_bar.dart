import 'package:flutter/material.dart';
import 'package:plant_shop/theme/app_colors.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Row(
          children: [
            buildIcon(),
            const SizedBox(width: 10),
            Flexible(child: buildTextFormField),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Image.asset(
      'assets/images/common/search.png',
      width: 32,
    );
  }

  Widget get buildTextFormField {
    return CustomTextFormField(
      controller: controller,
      hint: 'Search',
      onChanged: onChanged,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Function(String)? onChanged;
  final Function()? onFieldSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!();
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        hintMaxLines: 1,
        errorMaxLines: 1,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintStyle: AppTextStyle.regular(
          color: AppColors.gray80Percent,
          fontSize: 18,
        ),
        errorStyle: AppTextStyle.regular(
          fontSize: 15,
          color: Colors.red,
        ),
      ),
      style: AppTextStyle.regular(
        color: AppColors.dark,
        fontSize: 18,
      ),
    );
  }
}
