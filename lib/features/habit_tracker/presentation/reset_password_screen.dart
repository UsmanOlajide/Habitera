import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/features/auth/presentation/login_screen.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('is now on Reset Password Screen');
    return Scaffold(
      backgroundColor: ColorPicker.white,
      appBar: AppBar(backgroundColor: ColorPicker.white),
      body: Padding(
        padding: padAll16,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Create New Password',
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  kSizedBoxH10,
                  // Align(
                  //   alignment: AlignmentGeometry.centerLeft,
                  //   child: Text(
                  //     'Please enter your e-mail address to get a reset link',
                  //     style: context.textTheme.bodyLarge,
                  //   ),
                  // ),
                  kSizedBoxH20,
                  SigninField(
                    title: 'Password',
                    obscureText: false,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.validateNewPassword,
                    label: Text('Enter your new password'),
                  ),
                  SigninField(
                    title: 'Confirm Password',
                    obscureText: false,
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                    label: Text('Confirm your new password'),
                  ),
                  SizedBox(height: maxHeight * 0.03),
                  ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                final authService = ref.read(
                                  authServiceProvider,
                                );
                                await authService.updatePassword(
                                  _confirmPasswordController.text,
                                );
                                ref
                                    .read(isPasswordRecoveryProvider.notifier)
                                    .setRecovery(false);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 4),
                                      content: Text(
                                        'Password reset successfully',
                                      ),
                                    ),
                                  );
                                  context.goNamed(AppRoutes.navbar.name);
                                }
                              } catch (error) {
                                var message = 'Something went wrong. Try again';
                                if (error is AuthException) {
                                  message = error.message;
                                }
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(message),
                                    ),
                                  );
                                }
                              } finally {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                              return;
                            }
                          },
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    child: _isLoading
                        ? SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: ColorPicker.white,
                            ),
                          )
                        : Text('Send'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
