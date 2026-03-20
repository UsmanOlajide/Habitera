import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:habitera/common/theme/app_theme_data.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
// import 'package:habitera/isar_service.dart';
import 'package:habitera/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  // await IsarService.init();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // final prefs = await SharedPreferences.getInstance();
  // prefs.clear();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // late final AppLinks _appLinks;
  late StreamSubscription _linkSubscription;

  @override
  void initState() {
    super.initState();
    _linkSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      authState,
    ) {
      if (authState.event == AuthChangeEvent.passwordRecovery && mounted) {
        //  context.goNamed(AppRoutes.resetPasswordScreen.name);
        ref.read(isPasswordRecoveryProvider.notifier).setRecovery(true);
      }
    });
  }

  @override
  void dispose() {
    _linkSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Habitera',
      theme: AppThemeData.lightTheme,
    );
  }
}
