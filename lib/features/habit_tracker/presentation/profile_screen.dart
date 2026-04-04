import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/app_provider.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Supabase.instance.client.auth.currentUser;
    final email = user?.email ?? '';
    final name = user?.userMetadata?['name'] ?? '';

    String getInitials(String name) {
      final parts = name.trim().split(' ');
      if (parts.length >= 2) {
        return parts.first[0] + parts.last[0];
      }
      return parts.first[0];
    }

    final version = ref.watch(appVersionProvider).value ?? '';

    print(context.textTheme.titleLarge);
    // print(GoogleFonts.nunitoSans());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final smallTextStyle = context.small.copyWith(fontSize: 14.0);
          return Padding(
            padding: padAll16,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //app text theme
                  // Text('ABCDEFG', style: context.textTheme.titleLarge),
                  //new app text theme
                  // Text('ABCDEFG', style: context.screenTitle),
                  SizedBox(height: maxHeight * 0.14),
                  // // SizedBox(height: 60),
                  CircleAvatar(
                    backgroundColor: ColorPicker.grey,
                    radius: 40,
                    child: Text(
                      getInitials(name),
                      style: context.screenTitle.copyWith(fontSize: 28.0),
                    ),
                  ),
                  SizedBox(height: maxHeight * 0.04),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: context.body.copyWith(fontSize: 16.0),
                        ),
                        Text(email, style: smallTextStyle),
                      ],
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      final authService = ref.read(authServiceProvider);
                      await authService.signOut();
                    },
                    child: Text('Logout'),
                  ),
                  SizedBox(height: maxHeight * 0.01),
                  Text('Version $version', style: smallTextStyle),
                  SizedBox(height: maxHeight * 0.05),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
