import 'package:flutter/material.dart';
import 'package:plant_shop/pages/onboarding/models/onboarding_page_model.dart';
import 'package:plant_shop/theme/app_text_style.dart';

class OnboardingPages extends StatelessWidget {
  final List<OnboardingPageModel> pages;
  final PageController controller;
  final Function(int) onPageChanged;

  const OnboardingPages({
    super.key,
    required this.pages,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: pages.map((page) => buildPage(page)).toList(),
    );
  }

  Widget buildPage(OnboardingPageModel page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(page.image),
          const SizedBox(height: 25),
          buildTitle(page.title),
          const SizedBox(height: 10),
          buildDescription(page.description),
        ],
      ),
    );
  }

  Widget buildImage(String image) {
    return Image.asset(
      image,
      height: 400,
    );
  }

  Widget buildTitle(List<OnboardingPageTitle> title) {
    return RichText(
      text: TextSpan(
        children: title
            .map(
              (text) => TextSpan(
                text: text.text,
                style: AppTextStyle.bold(color: text.color, fontSize: 24),
              ),
            )
            .toList(),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescription(String description) {
    return Text(
      description,
      style: AppTextStyle.regular(fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
