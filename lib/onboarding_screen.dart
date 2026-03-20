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
    bool isLastPage = _currentPageIndex == pages.length - 1;
    if (isLastPage) print('on last page');
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
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
                  SizedBox(height: maxHeight * 0.18),

                  onboardingPageData.icon,
                  kSizedBoxH15,
                  Text(
                    onboardingPageData.title,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 19),
                  ),
                  kSizedBoxH10,
                  Text(
                    onboardingPageData.subtitle,
                    style: context.textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: maxHeight * 0.24),
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
              );
            },
          );
        },
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
