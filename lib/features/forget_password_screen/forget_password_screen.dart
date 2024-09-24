import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/utils/validator.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorEmail = '';
  late TextEditingController _emailController;

  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _emailController = TextEditingController();

    _emailFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                            title: Loc.alized.lbl_forget_password,
                            subtitle: Loc.alized.msg_forget_your_password,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: getHorizontalSize(340),
                              margin: getMargin(top: 110, right: 28),
                              child: Text18Bold(
                                title: Loc.alized.msg_please_enter_your,
                              ),
                            ),
                          ),
                          CustomTextFormField(
                            focusNode: _emailFocusNode,
                            controller: _emailController,
                            hintText: Loc.alized.lbl_email_address,
                            margin: getMargin(top: 62),
                            textInputType: TextInputType.emailAddress,
                            onValueChange: (value) {
                              _allValidation();
                            },
                            validator: (value) {
                              if (_errorEmail != "") {
                                return _errorEmail;
                              }
                              return null;
                            },
                          ),
                          CustomButton(
                            height: getVerticalSize(55),
                            text: Loc.alized.lbl_continue,
                            margin: getMargin(top: 43),
                            shape: ButtonShape.Square,
                            onTap: () {
                              if (_allValidation()) {
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

  bool _allValidation() {
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

    setState(() {});
    return isValid;
  }

  onTapTxtLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
