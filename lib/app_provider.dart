import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_provider.g.dart';

@riverpod
Future<String> appVersion(AppVersionRef ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

@riverpod
class HasSeenOnboarding extends _$HasSeenOnboarding {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    // final hasSeenOnboarding = prefs.containsKey('hasSeenOnboarding');
    return hasSeenOnboarding;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    state = AsyncData(true);
  }
}
