// ignore_for_file: must_be_immutable

import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/utils/validator.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorEmail = '';
  late TextEditingController _emailController;
  String _errorPassword = '';
  late TextEditingController _passwordController;

  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  double bottomPadding = 30;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        title: Loc.alized.lbl_welcome_back,
                        subtitle: Loc.alized.msg_login_to_your_account,
                      ),
                      CustomTextFormField(
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        hintText: Loc.alized.enterYourEmail,
                        margin: getMargin(top: 30),
                        textInputType: TextInputType.emailAddress,
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(64),
                        ),
                        onValueChange: (value) {
                          _allSignInValidation();
                        },
                        validator: (value) {
                          if (_errorEmail != "") {
                            return _errorEmail;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        hintText: Loc.alized.lbl_password,
                        margin: getMargin(top: 18),
                        padding: TextFormFieldPadding.PaddingAll17,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(64),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(64),
                        ),
                        isObscureText: true,
                        onValueChange: (value) {
                          _allSignInValidation();
                        },
                        validator: (value) {
                          if (_errorPassword != "") {
                            return _errorPassword;
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TapEffect(
                          onClick: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgetPasswordScreen);
                          },
                          child: Padding(
                            padding: getPadding(top: 31),
                            child: Text18BoldPrimary(
                              title: Loc.alized.msg_forget_password,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(55),
                        text: Loc.alized.lbl_login,
                        margin: getMargin(top: 57),
                        shape: ButtonShape.Square,
                        onTap: () {
                          if (_allSignInValidation()) {
                            Navigator.pushNamed(
                                context, AppRoutes.mainHomeContainerScreen);
                          } else {
                            "_allSignInValidation returned false".log();
                          }
                        },
                      ),
                      Padding(
                        padding: getPadding(left: 1, top: 39, right: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SocialAuthButton(
                              title: "Google",
                              image: LocalFiles.imgGoogle1,
                              onTap: () {},
                            ),
                            Padding(
                              padding: getPadding(bottom: 95),
                              child: Text18BoldGrey(
                                title: Loc.alized.lbl_or,
                              ),
                            ),
                            SocialAuthButton(
                              title: "Facebook",
                              image: LocalFiles.imgFacebook1,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 46, top: 60, right: 46),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(bottom: 1),
                              child: Text18BoldGrey(
                                title: Loc.alized.msg_don_t_have_an_account,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TapEffect(
                                onClick: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.signUpScreen,
                                  );
                                },
                                child: Text18BoldPrimary(
                                  title: Loc.alized.lbl_sign_up,
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
              SizedBox(height: bottomPadding)
            ],
          ),
        ),
      ),
    );
  }

  bool _allSignInValidation() {
    "_allSignInValidation is called".log();
    bool isValid = true;
    if (_emailController.text.trim().isEmpty) {
      _errorEmail = Loc.alized.emailCannotEmpty;
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = Loc.alized.enterValidEmail;
      isValid = false;
    } else {
      _errorEmail = '';
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
    setState(() {});
    return isValid;
  }
}
