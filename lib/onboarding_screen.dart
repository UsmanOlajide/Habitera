import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/app_provider.dart';

import 'package:habitera/constants/sizes.dart';
import 'package:habitera/utils/extensions.dart';

final iconSize = 90.0;

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  var _currentPageIndex = 0;

  final _pages = [
    OnboardingPageData(
      icon: Icon(Icons.track_changes_rounded, size: iconSize),
      title: 'Track your habits in one place',
      subtitle: 'Stay on top of your goals everyday',
    ),
    OnboardingPageData(
      icon: Icon(Icons.add_task_rounded, size: iconSize),
      title: 'Build or break habits',
      subtitle: 'Start good habits or eliminate bad ones',
    ),
    OnboardingPageData(
      icon: Icon(Icons.rocket_launch_rounded, size: iconSize),
      title: 'Get started',
      subtitle: 'Your journey to better habits begins now',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPageIndex == _pages.length - 1;
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
          final onboardingPageData = _pages[i];
          return OnboardingBody(onboardingPageData: onboardingPageData);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: OnboardingBottomSection(
          pages: _pages,
          currentPageIndex: _currentPageIndex,
          isLastPage: isLastPage,
          ref: ref,
          pageController: _pageController,
        ),
      ),
    );
  }
}

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({
    super.key,
    required List<OnboardingPageData> pages,
    required int currentPageIndex,
    required this.isLastPage,
    required this.ref,
    required PageController pageController,
  }) : _pages = pages,
       _currentPageIndex = currentPageIndex,
       _pageController = pageController;

  final List<OnboardingPageData> _pages;
  final int _currentPageIndex;
  final bool isLastPage;
  final WidgetRef ref;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pages.length, (i) {
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
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key, required this.onboardingPageData});

  final OnboardingPageData onboardingPageData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kSizedBoxH85,
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(24),
          ),
          child: onboardingPageData.icon,
        ),
        kSizedBoxH15,
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
        kSizedBoxH20,
      ],
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
