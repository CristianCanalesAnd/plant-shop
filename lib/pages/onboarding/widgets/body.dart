import 'package:flutter/material.dart';
import 'package:plant_shop/data/data.dart';
import 'package:plant_shop/pages/login/login_page.dart';

import 'onboarding_controls.dart';
import 'onboarding_dots.dart';
import 'onboarding_pages.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController();
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: OnboardingPages(
              pages: onboardingPages,
              controller: _pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  OnboardingDots(
                    dotsLength: onboardingPages.length,
                    indexSelected: _indexSelected,
                    onDotPressed: _onDotPressed,
                  ),
                  const SizedBox(height: 40),
                  OnboardingControls(
                    isLastPage: _indexSelected == onboardingPages.length - 1,
                    onSkipPressed: _onSkipPressed,
                    onNextPressed: _onNextPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Functions
  _onSkipPressed() {
    _navigateToLogInPage();
  }

  _onNextPressed() {
    setState(() {
      _indexSelected++;
    });

    if (_indexSelected != onboardingPages.length) {
      _animateToPage();
      return;
    }

    _navigateToLogInPage();
  }

  _navigateToLogInPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LogInPage()),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  _onDotPressed(int index) {
    setState(() {
      _indexSelected = index;
    });

    _animateToPage();
  }

  _animateToPage() {
    _pageController.animateToPage(
      _indexSelected,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
