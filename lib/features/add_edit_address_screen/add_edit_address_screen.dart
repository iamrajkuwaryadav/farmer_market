import 'package:crunchshop/core/controllers/localization_controller.dart';
import 'package:crunchshop/core/extensions/log_extension.dart';
import 'package:crunchshop/core/models/address_model.dart';
import 'package:crunchshop/exports/common_export.dart';
import 'package:crunchshop/exports/core_export.dart';
import 'package:flutter/material.dart';

class AddEditAddressScreen extends StatefulWidget {
  const AddEditAddressScreen({
    super.key,
    this.addressModel,
  });

  final AddressModel? addressModel;

  @override
  State<AddEditAddressScreen> createState() => _AddEditAddressScreenState();
}

class _AddEditAddressScreenState extends State<AddEditAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _errorName = "";
  late TextEditingController _nameController;
  String _errorPhone = "";
  late TextEditingController _phoneController;
  String _errorAddressLine1 = "";
  late TextEditingController _addressLine1Controller;
  String _errorAddressLine2 = "";
  late TextEditingController _addressLine2Controller;
  String _errorCity = "";
  late TextEditingController _cityNameController;
  String _errorCountry = "";
  late TextEditingController _countryNameController;
  String _errorZip = "";
  late TextEditingController _zipCodeController;

  late FocusNode _nameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _address1FocusNode;
  late FocusNode _address2FocusNode;
  late FocusNode _cityFocusNode;
  late FocusNode _countryFocusNode;
  late FocusNode _zipFocusNode;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressLine1Controller = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _cityNameController = TextEditingController();
    _countryNameController = TextEditingController();
    _zipCodeController = TextEditingController();
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _address1FocusNode = FocusNode();
    _address2FocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _countryFocusNode = FocusNode();
    _zipFocusNode = FocusNode();
    super.initState();

    checkIfEditAddress();
  }

  checkIfEditAddress() {
    if (widget.addressModel != null) {
      setState(() {
        _nameController.text = widget.addressModel?.fullName ?? "";
        _phoneController.text = widget.addressModel?.phoneNumber ?? "";
        _addressLine1Controller.text = widget.addressModel?.addressLine1 ?? "";
        _addressLine2Controller.text = widget.addressModel?.addressLine2 ?? "";
        _cityNameController.text = widget.addressModel?.city ?? "";
        _countryNameController.text = widget.addressModel?.country ?? "";
        _zipCodeController.text = widget.addressModel?.postalCode ?? "";
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityNameController.dispose();
    _countryNameController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(85),
          leadingWidth: 40,
          leading: AppbarImage(
              height: getVerticalSize(18),
              width: getHorizontalSize(10),
              svgPath: LocalFiles.imgArrowleft,
              margin: getMargin(left: 30, top: 19, bottom: 18),
              onTap: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: AppbarSubtitle1(
            text: widget.addressModel == null
                ? Loc.alized.lbl_add_address2
                : Loc.alized.lbl_edit_address,
          ),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                    height: getVerticalSize(1),
                    thickness: getVerticalSize(1),
                    color: AppColors.gray30001),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding:
                        getPadding(right: 30, left: 30, top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text18Bold(title: Loc.alized.lbl_full_name),
                              CustomTextFormField(
                                focusNode: _nameFocusNode,
                                controller: _nameController,
                                hintText: Loc.alized.lbl_enter_full_name,
                                margin: getMargin(top: 12),
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
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                    title: Loc.alized.lbl_phone_number),
                              ),
                              CustomTextFormField(
                                focusNode: _phoneFocusNode,
                                controller: _phoneController,
                                hintText: Loc.alized.msg_enter_phone_name,
                                margin: getMargin(top: 12),
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorPhone != "") {
                                    return _errorPhone;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                  title: Loc.alized.lbl_address_01,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _address1FocusNode,
                                controller: _addressLine1Controller,
                                hintText: Loc.alized.lbl_enter_address,
                                margin: getMargin(top: 12),
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorAddressLine1 != "") {
                                    return _errorAddressLine1;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                  title: Loc.alized.msg_address_02_optional,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _address2FocusNode,
                                controller: _addressLine2Controller,
                                hintText: Loc.alized.lbl_enter_address,
                                margin: getMargin(top: 11),
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorAddressLine2 != "") {
                                    return _errorAddressLine2;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                  title: Loc.alized.lbl_city,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _cityFocusNode,
                                controller: _cityNameController,
                                hintText: Loc.alized.lbl_enter_city,
                                margin: getMargin(top: 10),
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorCity != "") {
                                    return _errorCity;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                  title: Loc.alized.lbl_country,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _countryFocusNode,
                                controller: _countryNameController,
                                hintText: Loc.alized.country,
                                margin: getMargin(top: 10),
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorCountry != "") {
                                    return _errorCountry;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 15),
                                child: Text18Bold(
                                  title: Loc.alized.lbl_postcode,
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _zipFocusNode,
                                controller: _zipCodeController,
                                hintText: Loc.alized.lbl_enter_postcode,
                                margin: getMargin(top: 15),
                                textInputAction: TextInputAction.done,
                                onValueChange: (value) {
                                  _allValidation();
                                },
                                validator: (value) {
                                  if (_errorZip != "") {
                                    return _errorZip;
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: getPadding(top: 30),
                                child: Text18Bold(
                                  title:
                                      Loc.alized.msg_add_delivery_instructions,
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(368),
                                margin: getMargin(top: 12),
                                padding: getPadding(
                                    left: 20, top: 17, right: 0, bottom: 17),
                                decoration: AppDecoration.outlineGray300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            getMargin(right: 51, bottom: 114),
                                        child: const Text16Grey(
                                          title:
                                              "16 E Birch Hill Road Near Fairbanks,\nNY, 99312 United States",
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(55),
          text: Loc.alized.lbl_save_address,
          margin: getMargin(left: 30, right: 30, bottom: 38),
          shape: ButtonShape.Square,
          onTap: () {
            if (_allValidation()) {
              Navigator.pushNamed(context, AppRoutes.deliveryInformationScreen);
            } else {
              "_allSignInValidation returned false".log();
            }
          },
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

    if (_phoneController.text.trim().isEmpty) {
      _errorPhone = Loc.alized.required;
      isValid = false;
    } else {
      _errorPhone = '';
    }

    if (_addressLine1Controller.text.trim().isEmpty) {
      _errorAddressLine1 = Loc.alized.required;
      isValid = false;
    } else {
      _errorAddressLine1 = '';
    }

    if (_addressLine2Controller.text.trim().isEmpty) {
      _errorAddressLine2 = Loc.alized.required;
      isValid = false;
    } else {
      _errorAddressLine2 = '';
    }

    if (_cityNameController.text.trim().isEmpty) {
      _errorCity = Loc.alized.required;
      isValid = false;
    } else {
      _errorCity = '';
    }

    if (_countryNameController.text.trim().isEmpty) {
      _errorCountry = Loc.alized.required;
      isValid = false;
    } else {
      _errorCountry = '';
    }

    if (_zipCodeController.text.trim().isEmpty) {
      _errorZip = Loc.alized.required;
      isValid = false;
    } else {
      _errorZip = '';
    }

    setState(() {});
    return isValid;
  }
}
