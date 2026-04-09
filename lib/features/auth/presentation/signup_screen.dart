import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/constants/texts.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/features/auth/presentation/login_screen.dart';
import 'package:habitera/features/auth/signin_field.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:habitera/utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;
  var _obscureText = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelFontSize = 17.0;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    appName,
                    style: context.screenTitle.copyWith(fontSize: 26),
                  ),

                  SizedBox(height: 49.0),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Create your account',
                      style: context.screenTitle,
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  SigninField(
                    title: 'Name',
                    obscureText: false,
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    validator: Validators.validateName,
                    labelText: 'Enter your name',
                  ),
                  kSizedBoxH15,
                  SigninField(
                    title: 'Email Address',
                    obscureText: false,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    labelText: 'Enter your email',
                  ),
                  kSizedBoxH15,
                  SigninField(
                    title: 'Password',
                    obscureText: _obscureText,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: Validators.validatePassword,
                    labelText: 'Enter a strong password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? Icon(Icons.visibility_off_rounded)
                          : Icon(Icons.visibility_rounded),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                            FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  final authService = ref.read(
                                    authServiceProvider,
                                  );
                                  await authService.signUpWithEmailPassword(
                                    _emailController.text,
                                    _passwordController.text,
                                    _nameController.text,
                                  );
                                  if (context.mounted) {
                                    context.goNamed(
                                      AppRoutes.confirmEmailScreen.name,
                                      extra: _emailController.text,
                                    );
                                  }
                                } catch (error) {
                                  var message =
                                      'Something went wrong. Try again';
                                  if (error is AuthException) {
                                    message = error.message;
                                  }
                                  print(message);
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
                              }
                              return;
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
                          : Text('Sign up'),
                    ),
                  ),
                  kSizedBoxH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: context.body.copyWith(
                          fontSize: labelFontSize,
                          color: ColorPicker.grey,
                        ),
                      ),
                      kSizedBoxW4,
                      TextButton(
                        onPressed: () {
                          context.goNamed(AppRoutes.loginScreen.name);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Login here',
                          style: context.body.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: labelFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
