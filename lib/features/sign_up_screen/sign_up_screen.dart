import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/utils/validator.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorEmail = '';
  late TextEditingController _emailController;

  String _errorPhone = '';
  late TextEditingController _phoneController;

  String _errorPassword = '';
  late TextEditingController _passwordController;

  String _errorConfirmPassword = '';
  late TextEditingController _confirmPasswordController;

  late FocusNode _emailFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 29, top: 42, right: 29, bottom: 42),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LogoTitleSubtitle(
                        title: Loc.alized.lbl_register,
                        subtitle: Loc.alized.msg_create_new_account,
                      ),
                      CustomTextFormField(
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        hintText: Loc.alized.lbl_email_address,
                        margin: getMargin(top: 62),
                        textInputType: TextInputType.emailAddress,
                        onValueChange: (value) {
                          _allRegValidation();
                        },
                        validator: (value) {
                          if (_errorEmail != "") {
                            return _errorEmail;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        focusNode: _phoneFocusNode,
                        controller: _phoneController,
                        hintText: Loc.alized.lbl_phone_number,
                        margin: getMargin(top: 30),
                        textInputType: TextInputType.phone,
                        onValueChange: (value) {
                          _allRegValidation();
                        },
                        validator: (value) {
                          if (_errorPhone != "") {
                            return _errorPhone;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        hintText: Loc.alized.lbl_password,
                        margin: getMargin(top: 30),
                        textInputType: TextInputType.visiblePassword,
                        isObscureText: true,
                        onValueChange: (value) {
                          _allRegValidation();
                        },
                        validator: (value) {
                          if (_errorPassword != "") {
                            return _errorPassword;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        focusNode: _confirmPasswordFocusNode,
                        controller: _confirmPasswordController,
                        hintText: Loc.alized.msg_confirm_password,
                        margin: getMargin(top: 30),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        isObscureText: true,
                        onValueChange: (value) {
                          _allRegValidation();
                        },
                        validator: (value) {
                          if (_errorConfirmPassword != "") {
                            return _errorConfirmPassword;
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: getPadding(left: 0, top: 30, right: 46),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(bottom: 1),
                              child: Text16Regular(
                                title: Loc.alized.msg_by_signing_below2,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TapEffect(
                                onClick: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.loginScreen,
                                  );
                                },
                                child: const Text16RegularPrimary(
                                  title: "Term of Use",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 0, top: 0, right: 46),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(bottom: 1),
                              child: Text16Regular(
                                title: Loc.alized.lbl_and,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TapEffect(
                                onClick: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.loginScreen,
                                  );
                                },
                                child: const Text16RegularPrimary(
                                  title: "Privacy Policy",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(55),
                        text: "Sign Up",
                        margin: getMargin(top: 43),
                        shape: ButtonShape.Square,
                        onTap: () {
                          if (_allRegValidation()) {
                            Navigator.pushNamed(
                                context, AppRoutes.mainHomePage);
                          } else {
                            "_allSignInValidation returned false".log();
                          }
                        },
                      ),
                      Padding(
                        padding: getPadding(left: 46, top: 30, right: 46),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(bottom: 1),
                              child: Text18BoldGrey(
                                title: Loc.alized.msg_already_have_an,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TapEffect(
                                onClick: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.loginScreen,
                                  );
                                },
                                child: Text18BoldPrimary(
                                  title: Loc.alized.lbl_login,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _allRegValidation() {
    bool isValid = true;

    // email Validation
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = Loc.alized.emailCannotEmpty;
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = Loc.alized.enterValidEmail;
      isValid = false;
    } else {
      _errorEmail = '';
    }

    // Phone Validation
    if (_phoneController.text.trim().isEmpty) {
      _errorPhone = Loc.alized.lbl_phone_number;
      isValid = false;
    } else if (!Validator.validatePhone(_phoneController.text.trim())) {
      _errorPhone = Loc.alized.valid_phone;
      isValid = false;
    } else {
      _errorPhone = '';
    }

    if (_passwordController.text.trim().isEmpty) {
      _errorPassword = Loc.alized.passwordCannotEmpty;
      isValid = false;
    } else if (_passwordController.text.trim().length < 8) {
      _errorPassword = Loc.alized.validPasswordLogin;
      isValid = false;
    } else {
      _errorPassword = '';
    }

    // Repeat Password Validation
    if (_confirmPasswordController.text.trim().isEmpty) {
      _errorConfirmPassword = Loc.alized.confirm_password_must_be_same;
      isValid = false;
    } else if (_confirmPasswordController.text.trim() !=
        _passwordController.text.trim()) {
      _errorConfirmPassword = Loc.alized.confirm_password_must_be_same;
      isValid = false;
    } else {
      _errorConfirmPassword = '';
    }
    setState(() {});
    return isValid;
  }

  onTapTxtLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
