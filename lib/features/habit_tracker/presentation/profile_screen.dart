import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          return Padding(
            padding: padAll16,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: maxHeight * 0.14),
                  CircleAvatar(
                    backgroundColor: ColorPicker.grey,
                    radius: 40,
                    child: Text(
                      getInitials(name),
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  SizedBox(height: maxHeight * 0.04),
                  Text(
                    name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(email),
                  SizedBox(height: maxHeight * 0.14),

                  ElevatedButton(
                    onPressed: () async {
                      final authService = ref.read(authServiceProvider);
                      await authService.signOut();
                    },
                    child: Text('Logout'),
                  ),
                  SizedBox(height: maxHeight * 0.14),
                  Text('Version $version'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
