import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/common/theme/app_theme_data.dart';
import 'package:habitera/isar_service.dart';
import 'package:habitera/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Habitera',
      theme: AppThemeData.lightTheme,
    );
  }
}