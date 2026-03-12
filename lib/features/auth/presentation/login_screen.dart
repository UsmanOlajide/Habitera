import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/auth/presentation/auth_provider.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:habitera/utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoading = false;
  var _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('is now on Login Screen');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              // final maxWidth = constraints.maxWidth;
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: maxHeight * 0.02),
                      Text(
                        'habitera',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: maxHeight * 0.14),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: Text(
                          'Login to your account',
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28.0),
                      SigninField(
                        title: 'Email Address',
                        obscureText: false,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                        label: Text('youremail@mail.com'),
                      ),
                      SizedBox(height: 20),
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
                      kSizedBoxH10,
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // context.pushNamed(
                            //   AppRoutes.forgotPasswordScreen.name,
                            // );
                            context.goNamed(
                              AppRoutes.forgotPasswordScreen.name,
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: ColorPicker.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    final authService = ref.read(
                                      authServiceProvider,
                                    );
                                    await authService.signInWithEmailPassword(
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                  } catch (error) {
                                    var message =
                                        'Something went wrong. Try again';
                                    if (error is AuthException) {
                                      message = error.message;
                                    }
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
                                      isLoading = false;
                                    });
                                    // print(ref.read(isLoggedInProvider));
                                  }
                                  // context.goNamed(AppRoutes.navbar.name);
                                }
                                return;
                              },
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                        child: isLoading
                            ? SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  color: ColorPicker.white,
                                ),
                              )
                            : Text('Login'),
                      ),
                      kSizedBoxH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 17,
                              color: ColorPicker.grey,
                            ),
                          ),
                          kSizedBoxW4,
                          TextButton(
                            onPressed: () {
                              context.goNamed(AppRoutes.signupScreen.name);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Create one',
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

class SigninField extends StatelessWidget {
  const SigninField({
    super.key,
    required this.title,
    this.controller,
    this.onChanged,
    required this.obscureText,
    this.keyboardType,
    this.validator,
    this.label,
    this.suffixIcon,
  });

  final String title;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          kSizedBoxH8,
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType ?? TextInputType.name,
            validator: validator,
            decoration: InputDecoration(label: label, suffixIcon: suffixIcon),
          ),
        ],
      ),
    );
  }
}

class OldSigninField extends StatelessWidget {
  const OldSigninField({
    super.key,
    this.prefixIcon,
    this.label,
    this.isDense,
    this.validator,
    this.onChanged,
    this.focusedBorder,
    this.enabledBorder,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });

  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final bool? isDense;
  final bool obscureText;
  final Function(String)? onChanged;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: const BoxDecoration(
        color: ColorPicker.red,
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(229, 233, 237, 0.24),
        //     blurRadius: 5,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: TextFormField(
        // cursorColor: ColorPicker.black,
        // cursorHeight: 15.0,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType ?? TextInputType.name,
        validator: validator,
        // style: context.textTheme.bodySmall?.copyWith(
        //   color: ColorPicker.black,
        //   height: 0,
        // ),
        decoration: InputDecoration(
          isDense: isDense ?? true,
          border: InputBorder.none,
          // prefixIconConstraints: const BoxConstraints(minWidth: 125),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          // suffixIconConstraints: const BoxConstraints(minWidth: 0),
          label: label,
          // contentPadding: const EdgeInsets.symmetric(
          //   horizontal: 15.0,
          //   vertical: 15.0,
          // ),
          focusedBorder:
              focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
          enabledBorder:
              enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: ColorPicker.grey,
                  width: 0.5,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: ColorPicker.red),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
