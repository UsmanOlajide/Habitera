// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/app_provider.dart';

import 'package:habitera/constants/sizes.dart';
import 'package:habitera/utils/extensions.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  var _currentPageIndex = 0;

  final pages = [
    OnboardingPageData(
      icon: Icon(Icons.track_changes_rounded, size: 90),
      title: 'Track your habits in one place',
      subtitle: 'Stay on top of your goals everyday',
    ),
    OnboardingPageData(
      icon: Icon(Icons.add_task_rounded, size: 90),
      title: 'Build or break habits',
      subtitle: 'Start good habits or eliminate bad ones',
    ),
    OnboardingPageData(
      icon: Icon(Icons.rocket_launch_rounded, size: 90),
      title: 'Get started',
      subtitle: 'Your journey to better habits begins now',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(context.textTheme.titleLarge);
    // print(context.textTheme.bodyLarge);
    // print(context.screenTitle);
    bool isLastPage = _currentPageIndex == pages.length - 1;
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
            // _isNewPage =
          });
        },
        itemBuilder: (_, i) {
          final onboardingPageData = pages[i];
          return LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: maxHeight * 0.16),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: onboardingPageData.icon,
                  ),
                  // kSizedBoxH15,
                  SizedBox(height: maxHeight * 0.028),
                  Text(
                    onboardingPageData.title,
                    style: context.screenTitle,
                    textAlign: TextAlign.center,
                  ),
                  kSizedBoxH10,
                  Text(
                    onboardingPageData.subtitle,
                    style: context.body.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: maxHeight * 0.04),
                ],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (i) {
                return Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPageIndex == i ? Colors.black : Colors.grey,
                  ),
                );
              }),
            ),
            kSizedBoxH20,
            ElevatedButton(
              onPressed: isLastPage
                  ? () {
                      ref
                          .read(hasSeenOnboardingProvider.notifier)
                          .completeOnboarding();
                    }
                  : () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
              child: Text(isLastPage ? 'Get started' : 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPageData {
  OnboardingPageData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final Icon icon;
  final String title;
  final String subtitle;
}
