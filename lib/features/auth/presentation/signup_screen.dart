import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/features/auth/presentation/login_screen.dart';
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
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'habitera',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: maxHeight * 0.08),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Text(
                          'Create your account',
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      SigninField(
                        title: 'Name',
                        obscureText: false,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        validator: Validators.validateName,
                        label: Text('John Doe'),
                      ),
                      kSizedBoxH15,
                      SigninField(
                        title: 'Email Address',
                        obscureText: false,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                        label: Text('youremail@mail.com'),
                      ),
                      kSizedBoxH15,
                      SigninField(
                        title: 'Password',
                        obscureText: _obscureText,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validators.validatePassword,
                        label: Text('*******'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? Icon(Icons.visibility_rounded)
                              : Icon(Icons.visibility_off_rounded),
                        ),
                      ),
                      // SizedBox(height: 40),
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
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
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
                      kSizedBoxH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 17,
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
                              style: context.textTheme.labelMedium?.copyWith(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
