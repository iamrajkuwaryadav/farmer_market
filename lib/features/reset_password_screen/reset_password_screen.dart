import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorPassword = '';
  late TextEditingController _passwordController;

  String _errorConfirmPassword = '';
  late TextEditingController _confirmPasswordController;

  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 29, top: 42, right: 29, bottom: 42),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LogoTitleSubtitle(
                            title: Loc.alized.lbl_reset,
                            subtitle: Loc.alized.msg_reset_your_password,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(340),
                              margin: getMargin(top: 60, right: 28),
                              child: Text18Bold(
                                title: Loc.alized.msg_enter_your_new_password,
                              ),
                            ),
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
                          CustomButton(
                            height: getVerticalSize(55),
                            text: Loc.alized.lbl_change_password,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: SafeArea(
                child: AppbarImage(
                  height: getVerticalSize(25),
                  width: getHorizontalSize(25),
                  svgPath: LocalFiles.imgArrowleft,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _allRegValidation() {
    bool isValid = true;

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
