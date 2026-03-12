import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/features/auth/presentation/login_screen.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:habitera/utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotpasswordScreen extends ConsumerStatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  ConsumerState<ForgotpasswordScreen> createState() =>
      _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends ConsumerState<ForgotpasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('is now on Forgot Password Screen');

    return Scaffold(
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
                      'Forgot Password',
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  kSizedBoxH10,
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Please enter your e-mail address to get a reset link',
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  kSizedBoxH20,
                  SigninField(
                    title: 'Email Address',
                    obscureText: false,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    label: Text('youremail@mail.com'),
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
                                await authService.sendPasswordResetEmail(
                                  _emailController.text,
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 4),
                                      content: Text(
                                        'Password reset link sent. Check your email.',
                                      ),
                                    ),
                                  );
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
