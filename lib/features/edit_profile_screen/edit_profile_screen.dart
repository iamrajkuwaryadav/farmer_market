import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/utils/validator.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:crunchshop/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _selectedDate = "20/02/1995";

  String _errorName = "";
  late TextEditingController _nameController;
  String _errorEmail = '';
  late TextEditingController _emailController;
  String _errorPassword = '';
  late TextEditingController _passwordController;

  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    super.initState();

    setValues();
  }

  setValues() {
    setState(() {
      _nameController.text = "Saul Goodmate";
      _emailController.text = "goodmate@gmail.com";
      _passwordController.text = "##test123";
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: Localizations.localeOf(context),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked.format();
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(87),
          leadingWidth: 40,
          leading: AppbarImage(
            height: getVerticalSize(18),
            width: getHorizontalSize(10),
            svgPath: LocalFiles.imgArrowleft,
            margin: getMargin(left: 30, top: 19, bottom: 18),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle1(text: "Edit Profile"),
          actions: [
            InkWell(
              onTap: () {
                if (_allValidation()) {
                  Navigator.pop(context);
                } else {
                  "_allSignInValidation returned false".log();
                }
              },
              child: SizedBox(
                height: getVerticalSize(87),
                width: getHorizontalSize(70),
                child: Center(
                  child: Text18BoldPrimary(
                    title: Loc.alized.lbl_save,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  width: double.maxFinite,
                  padding: getPadding(top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const DividerWidget(),
                      ProfileImageWidget(
                        imagePath: LocalFiles.imgImage150x150,
                        iconPath: LocalFiles.imgCamera,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.editProfileScreen);
                        },
                      ),
                      Padding(
                        padding: getPadding(top: 19),
                        child: const HeadingText20(
                          title: "Saul Goodmate",
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 7, bottom: 30),
                        child: const Text18BoldGrey(
                          title: "saulgo35@gmail.com",
                        ),
                      ),
                      CustomTextFormField(
                        focusNode: _nameFocusNode,
                        controller: _nameController,
                        hintText: Loc.alized.lbl_enter_full_name,
                        margin: getMargin(left: 30, top: 48, right: 30),
                        onValueChange: (value) {
                          _allValidation();
                        },
                        validator: (value) {
                          if (_errorName != "") {
                            return _errorName;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: _emailController,
                        hintText: Loc.alized.lbl_email_address,
                        margin: getMargin(left: 30, top: 35, right: 30),
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
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: _passwordController,
                        hintText: Loc.alized.lbl_password,
                        margin: getMargin(left: 30, top: 35, right: 30),
                        padding: TextFormFieldPadding.PaddingAll14,
                        textInputAction: TextInputAction.done,
                        onValueChange: (value) {
                          _allValidation();
                        },
                        validator: (value) {
                          if (_errorPassword != "") {
                            return _errorPassword;
                          }
                          return null;
                        },
                      ),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          margin: getMargin(
                              left: 30, top: 35, right: 30, bottom: 5),
                          padding: getPadding(
                              left: 25, top: 16, right: 25, bottom: 16),
                          decoration: AppDecoration.outlineGray300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text16SemiBold(title: _selectedDate.toString()),
                              CustomImageView(
                                svgPath: LocalFiles.imgCalendar,
                                height: getSize(19),
                                width: getSize(19),
                                margin: getMargin(
                                  top: 1,
                                  bottom: 1,
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
            ],
          ),
        ),
      ),
    );
  }

  bool _allValidation() {
    "_allSignInValidation is called".log();
    bool isValid = true;

    if (_nameController.text.trim().isEmpty) {
      _errorName = Loc.alized.required;
      isValid = false;
    } else {
      _errorName = '';
    }

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
