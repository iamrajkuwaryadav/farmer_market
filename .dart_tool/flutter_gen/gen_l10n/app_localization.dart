import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_af.dart';
import 'app_localization_ar.dart';
import 'app_localization_de.dart';
import 'app_localization_en.dart';
import 'app_localization_es.dart';
import 'app_localization_fr.dart';
import 'app_localization_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('zh')
  ];

  /// No description provided for @msg_network_err.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get msg_network_err;

  /// No description provided for @msg_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong!'**
  String get msg_something_went_wrong;

  /// No description provided for @lbl_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get lbl_continue;

  /// No description provided for @msg_create_new_account.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get msg_create_new_account;

  /// No description provided for @lbl_credit_card.
  ///
  /// In en, this message translates to:
  /// **'CREDIT CARD'**
  String get lbl_credit_card;

  /// No description provided for @lbl_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get lbl_logout;

  /// No description provided for @lbl_email_address.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get lbl_email_address;

  /// No description provided for @msg_out_for_delivery.
  ///
  /// In en, this message translates to:
  /// **'Out For Delivery'**
  String get msg_out_for_delivery;

  /// No description provided for @lbl_traveling_bags.
  ///
  /// In en, this message translates to:
  /// **'Traveling Bags'**
  String get lbl_traveling_bags;

  /// No description provided for @msg_get_fast_local_delivery.
  ///
  /// In en, this message translates to:
  /// **'Get Fast Local Delivery'**
  String get msg_get_fast_local_delivery;

  /// No description provided for @msg_recent_save_addresses.
  ///
  /// In en, this message translates to:
  /// **'Recent Save Addresses :'**
  String get msg_recent_save_addresses;

  /// No description provided for @lbl_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get lbl_reset_password;

  /// No description provided for @msg_don_t_have_an_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get msg_don_t_have_an_account;

  /// No description provided for @msg_recent_delivery.
  ///
  /// In en, this message translates to:
  /// **'Recent Delivery Address :'**
  String get msg_recent_delivery;

  /// No description provided for @msg_shipping_addresses.
  ///
  /// In en, this message translates to:
  /// **'Shipping Addresses'**
  String get msg_shipping_addresses;

  /// No description provided for @lbl_new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get lbl_new_password;

  /// No description provided for @lbl_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get lbl_phone_number;

  /// No description provided for @lbl_kitchen.
  ///
  /// In en, this message translates to:
  /// **'Kitchen'**
  String get lbl_kitchen;

  /// No description provided for @lbl_modern.
  ///
  /// In en, this message translates to:
  /// **'Modern'**
  String get lbl_modern;

  /// No description provided for @lbl_cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get lbl_cvv;

  /// No description provided for @msg_check_your_app_s.
  ///
  /// In en, this message translates to:
  /// **'Check your app\'s UI from the below demo screens of your app.'**
  String get msg_check_your_app_s;

  /// No description provided for @lbl_enter_city.
  ///
  /// In en, this message translates to:
  /// **'Enter City'**
  String get lbl_enter_city;

  /// No description provided for @lbl_goggles.
  ///
  /// In en, this message translates to:
  /// **'Goggles'**
  String get lbl_goggles;

  /// No description provided for @lbl_pay_now.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get lbl_pay_now;

  /// No description provided for @msg_air_superiority.
  ///
  /// In en, this message translates to:
  /// **'Air Superiority Blue'**
  String get msg_air_superiority;

  /// No description provided for @lbl_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get lbl_change;

  /// No description provided for @msg_select_delivery.
  ///
  /// In en, this message translates to:
  /// **'Select  Delivery Address :'**
  String get msg_select_delivery;

  /// No description provided for @lbl_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get lbl_expiry_date;

  /// No description provided for @lbl_rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get lbl_rewards;

  /// No description provided for @msg_payment_success.
  ///
  /// In en, this message translates to:
  /// **'Payment Success !'**
  String get msg_payment_success;

  /// No description provided for @msg_earn_points_for.
  ///
  /// In en, this message translates to:
  /// **'Earn Points For Shopping'**
  String get msg_earn_points_for;

  /// No description provided for @lbl_add_address2.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get lbl_add_address2;

  /// No description provided for @lbl_brand.
  ///
  /// In en, this message translates to:
  /// **'Brand : '**
  String get lbl_brand;

  /// No description provided for @lbl_enter_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Address'**
  String get lbl_enter_address;

  /// No description provided for @msg_available_in_stock.
  ///
  /// In en, this message translates to:
  /// **'Available in stock'**
  String get msg_available_in_stock;

  /// No description provided for @msg_out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get msg_out_of_stock;

  /// No description provided for @lbl_newest_arrival.
  ///
  /// In en, this message translates to:
  /// **'Newest Arrival'**
  String get lbl_newest_arrival;

  /// No description provided for @msg_are_you_want_to.
  ///
  /// In en, this message translates to:
  /// **'Are you want to delete this product?'**
  String get msg_are_you_want_to;

  /// No description provided for @lbl_card_number.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get lbl_card_number;

  /// No description provided for @lbl_delete_product.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get lbl_delete_product;

  /// No description provided for @lbl_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get lbl_password;

  /// No description provided for @lbl_payment_success.
  ///
  /// In en, this message translates to:
  /// **'Payment Success'**
  String get lbl_payment_success;

  /// No description provided for @msg_arriving_saturday.
  ///
  /// In en, this message translates to:
  /// **'Arriving Saturday'**
  String get msg_arriving_saturday;

  /// No description provided for @msg_card_holder_name.
  ///
  /// In en, this message translates to:
  /// **'Card Holder Name'**
  String get msg_card_holder_name;

  /// No description provided for @msg_please_enter_your.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address below\nyou will receive a link to create a new \npassword via email'**
  String get msg_please_enter_your;

  /// No description provided for @lbl_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get lbl_apply;

  /// No description provided for @lbl_no_card_details.
  ///
  /// In en, this message translates to:
  /// **'No Card Details'**
  String get lbl_no_card_details;

  /// No description provided for @lbl_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get lbl_city;

  /// No description provided for @msg_forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password ?'**
  String get msg_forget_password;

  /// No description provided for @lbl_phone_number2.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get lbl_phone_number2;

  /// No description provided for @msg_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method :'**
  String get msg_payment_method;

  /// No description provided for @lbl_smart_watches.
  ///
  /// In en, this message translates to:
  /// **'Smart Watches'**
  String get lbl_smart_watches;

  /// No description provided for @msg_product_added_to.
  ///
  /// In en, this message translates to:
  /// **'Product Added To Cart'**
  String get msg_product_added_to;

  /// No description provided for @lbl_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get lbl_change_password;

  /// No description provided for @lbl_please_wait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait'**
  String get lbl_please_wait;

  /// No description provided for @lbl_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get lbl_yes;

  /// No description provided for @lbl_contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get lbl_contact_us;

  /// No description provided for @lbl_add_address.
  ///
  /// In en, this message translates to:
  /// **'Add\nAddress'**
  String get lbl_add_address;

  /// No description provided for @lbl_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get lbl_sign_up;

  /// No description provided for @lbl_colour.
  ///
  /// In en, this message translates to:
  /// **'Colour :'**
  String get lbl_colour;

  /// No description provided for @msg_delivery_information.
  ///
  /// In en, this message translates to:
  /// **'Delivery Information'**
  String get msg_delivery_information;

  /// No description provided for @lbl_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get lbl_privacy_policy;

  /// No description provided for @lbl_register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get lbl_register;

  /// No description provided for @lbl_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get lbl_save;

  /// No description provided for @msg_forget_your_password.
  ///
  /// In en, this message translates to:
  /// **'Forget your password'**
  String get msg_forget_your_password;

  /// No description provided for @msg_enter_card_holder.
  ///
  /// In en, this message translates to:
  /// **'Enter Card Holder Name'**
  String get msg_enter_card_holder;

  /// No description provided for @lbl_shipping_charge.
  ///
  /// In en, this message translates to:
  /// **'Shipping Charge'**
  String get lbl_shipping_charge;

  /// No description provided for @lbl_add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get lbl_add_to_cart;

  /// No description provided for @lbl_warranty_policy.
  ///
  /// In en, this message translates to:
  /// **'Warranty Policy'**
  String get lbl_warranty_policy;

  /// No description provided for @msg_default_address.
  ///
  /// In en, this message translates to:
  /// **'Default Address :'**
  String get msg_default_address;

  /// No description provided for @lbl_resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get lbl_resend_otp;

  /// No description provided for @msg_by_signing_below2.
  ///
  /// In en, this message translates to:
  /// **'By signing below, you agree to the '**
  String get msg_by_signing_below2;

  /// No description provided for @msg_wow_express_offers.
  ///
  /// In en, this message translates to:
  /// **'Wow Express offers cash on delivery\nservices and fast delivery services\nso that your customers.'**
  String get msg_wow_express_offers;

  /// No description provided for @msg_enter_card_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Card Number'**
  String get msg_enter_card_number;

  /// No description provided for @lbl_after_delete.
  ///
  /// In en, this message translates to:
  /// **'After Delete'**
  String get lbl_after_delete;

  /// No description provided for @lbl_delete_card.
  ///
  /// In en, this message translates to:
  /// **'Delete Card'**
  String get lbl_delete_card;

  /// No description provided for @msg_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get msg_verification_code;

  /// No description provided for @lbl_ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get lbl_ok;

  /// No description provided for @lbl_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get lbl_welcome_back;

  /// No description provided for @lbl_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get lbl_or;

  /// No description provided for @lbl_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get lbl_help;

  /// No description provided for @msg_cash_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash On Delivery'**
  String get msg_cash_on_delivery;

  /// No description provided for @msg_all_delivery_address.
  ///
  /// In en, this message translates to:
  /// **'All Delivery Address :'**
  String get msg_all_delivery_address;

  /// No description provided for @msg_enter_phone_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get msg_enter_phone_name;

  /// No description provided for @lbl_postcode.
  ///
  /// In en, this message translates to:
  /// **'Postcode'**
  String get lbl_postcode;

  /// No description provided for @lbl_enter_postcode.
  ///
  /// In en, this message translates to:
  /// **'Enter Postcode'**
  String get lbl_enter_postcode;

  /// No description provided for @lbl_model_name.
  ///
  /// In en, this message translates to:
  /// **'Model Name :'**
  String get lbl_model_name;

  /// No description provided for @lbl_track_order.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get lbl_track_order;

  /// No description provided for @msg_delete_this_card.
  ///
  /// In en, this message translates to:
  /// **'Delete this Card?'**
  String get msg_delete_this_card;

  /// No description provided for @msg_address_02_optional.
  ///
  /// In en, this message translates to:
  /// **'Address 02 (Optional)'**
  String get msg_address_02_optional;

  /// No description provided for @msg_write_something.
  ///
  /// In en, this message translates to:
  /// **'Write Something Here'**
  String get msg_write_something;

  /// No description provided for @lbl_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get lbl_next;

  /// No description provided for @lbl_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get lbl_no;

  /// No description provided for @msg_password_change.
  ///
  /// In en, this message translates to:
  /// **'Password change successfully'**
  String get msg_password_change;

  /// No description provided for @lbl_wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get lbl_wishlist;

  /// No description provided for @msg_delivery_information2.
  ///
  /// In en, this message translates to:
  /// **'Delivery Information :'**
  String get msg_delivery_information2;

  /// No description provided for @msg_already_have_an.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get msg_already_have_an;

  /// No description provided for @lbl_clothes.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get lbl_clothes;

  /// No description provided for @lbl_country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get lbl_country;

  /// No description provided for @msg_debit_credit_card.
  ///
  /// In en, this message translates to:
  /// **'Debit/Credit card'**
  String get msg_debit_credit_card;

  /// No description provided for @msg_are_you_want_to2.
  ///
  /// In en, this message translates to:
  /// **'Are you want to delete this card?'**
  String get msg_are_you_want_to2;

  /// No description provided for @msg_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get msg_confirm_password;

  /// No description provided for @msg_the_purpose_of_reward.
  ///
  /// In en, this message translates to:
  /// **'The purpose of reward points is to provide\nan incentive for customers to make\nrepeat purchases.'**
  String get msg_the_purpose_of_reward;

  /// No description provided for @lbl_please_wait_one.
  ///
  /// In en, this message translates to:
  /// **'Please Wait One'**
  String get lbl_please_wait_one;

  /// No description provided for @lbl_bank_name.
  ///
  /// In en, this message translates to:
  /// **'BANK NAME'**
  String get lbl_bank_name;

  /// No description provided for @lbl_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get lbl_dark_mode;

  /// No description provided for @msg_get_free_delivery.
  ///
  /// In en, this message translates to:
  /// **'Get Free Delivery'**
  String get msg_get_free_delivery;

  /// No description provided for @msg_we_have_sent_otp.
  ///
  /// In en, this message translates to:
  /// **'We have sent OTP on your number'**
  String get msg_we_have_sent_otp;

  /// No description provided for @lbl_pay_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Pay On Delivery'**
  String get lbl_pay_on_delivery;

  /// No description provided for @lbl_address_01.
  ///
  /// In en, this message translates to:
  /// **'Address 01'**
  String get lbl_address_01;

  /// No description provided for @lbl_style.
  ///
  /// In en, this message translates to:
  /// **'Style :'**
  String get lbl_style;

  /// No description provided for @lbl_save_address.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get lbl_save_address;

  /// No description provided for @lbl_edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get lbl_edit_profile;

  /// No description provided for @msg_add_delivery_instructions.
  ///
  /// In en, this message translates to:
  /// **'Add Delivery Instructions'**
  String get msg_add_delivery_instructions;

  /// No description provided for @lbl_07_days_replace.
  ///
  /// In en, this message translates to:
  /// **'07 Days Replace'**
  String get lbl_07_days_replace;

  /// No description provided for @lbl_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get lbl_reset;

  /// No description provided for @lbl_my_account.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get lbl_my_account;

  /// No description provided for @lbl_new_sport_shoes.
  ///
  /// In en, this message translates to:
  /// **'New Sport Shoes'**
  String get lbl_new_sport_shoes;

  /// No description provided for @lbl_about_this_item.
  ///
  /// In en, this message translates to:
  /// **'About this item'**
  String get lbl_about_this_item;

  /// No description provided for @lbl_toys.
  ///
  /// In en, this message translates to:
  /// **'Toys'**
  String get lbl_toys;

  /// No description provided for @msg_shipped_tuesday.
  ///
  /// In en, this message translates to:
  /// **'Shipped Tuesday, 20 January 2023'**
  String get msg_shipped_tuesday;

  /// No description provided for @msg_password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get msg_password_changed;

  /// No description provided for @lbl_my_orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get lbl_my_orders;

  /// No description provided for @lbl_forget.
  ///
  /// In en, this message translates to:
  /// **'Forget'**
  String get lbl_forget;

  /// No description provided for @lbl_color_variant.
  ///
  /// In en, this message translates to:
  /// **'Color Variant'**
  String get lbl_color_variant;

  /// No description provided for @msg_discover_new_products.
  ///
  /// In en, this message translates to:
  /// **'Discover New Products'**
  String get msg_discover_new_products;

  /// No description provided for @msg_card_holder_name2.
  ///
  /// In en, this message translates to:
  /// **'CARD HOLDER NAME'**
  String get msg_card_holder_name2;

  /// No description provided for @lbl_privacy_notice.
  ///
  /// In en, this message translates to:
  /// **'privacy notice'**
  String get lbl_privacy_notice;

  /// No description provided for @lbl_add_card.
  ///
  /// In en, this message translates to:
  /// **'+ Add Card'**
  String get lbl_add_card;

  /// No description provided for @msg_don_t_receive_a.
  ///
  /// In en, this message translates to:
  /// **'Don’t receive a OTP? Resend OTP'**
  String get msg_don_t_receive_a;

  /// No description provided for @lbl_forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get lbl_forget_password;

  /// No description provided for @lbl_subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get lbl_subtotal;

  /// No description provided for @lbl_promocodes.
  ///
  /// In en, this message translates to:
  /// **'Promocodes'**
  String get lbl_promocodes;

  /// No description provided for @lbl_team_of_use.
  ///
  /// In en, this message translates to:
  /// **'Team of use\n'**
  String get lbl_team_of_use;

  /// No description provided for @msg_fill_the_given_details.
  ///
  /// In en, this message translates to:
  /// **'Fill The Given Details And Create New\nShipping Address'**
  String get msg_fill_the_given_details;

  /// No description provided for @msg_login_to_your_account.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get msg_login_to_your_account;

  /// No description provided for @lbl_bag.
  ///
  /// In en, this message translates to:
  /// **'Bag'**
  String get lbl_bag;

  /// No description provided for @lbl_mobiles.
  ///
  /// In en, this message translates to:
  /// **'Mobiles'**
  String get lbl_mobiles;

  /// No description provided for @msg_reset_your_password.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get msg_reset_your_password;

  /// No description provided for @lbl_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get lbl_total;

  /// No description provided for @msg_your_order_placed.
  ///
  /// In en, this message translates to:
  /// **'Your order placed successfully'**
  String get msg_your_order_placed;

  /// No description provided for @msg_otp_verification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get msg_otp_verification;

  /// No description provided for @msg_delete_this_product.
  ///
  /// In en, this message translates to:
  /// **'Delete this product?'**
  String get msg_delete_this_product;

  /// No description provided for @msg_enter_your_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter Your New Password'**
  String get msg_enter_your_new_password;

  /// No description provided for @lbl_order_info.
  ///
  /// In en, this message translates to:
  /// **'Order Info'**
  String get lbl_order_info;

  /// No description provided for @lbl_and.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get lbl_and;

  /// No description provided for @lbl_add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get lbl_add_new_address;

  /// No description provided for @msg_search_smartphone.
  ///
  /// In en, this message translates to:
  /// **'Search “Smartphone”'**
  String get msg_search_smartphone;

  /// No description provided for @msg_search_results.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get msg_search_results;

  /// No description provided for @lbl_edit_address.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get lbl_edit_address;

  /// No description provided for @lbl_shoes.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get lbl_shoes;

  /// No description provided for @lbl_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get lbl_payment_method;

  /// No description provided for @lbl_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get lbl_login;

  /// No description provided for @lbl_checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get lbl_checkout;

  /// No description provided for @msg_many_new_products.
  ///
  /// In en, this message translates to:
  /// **'Many new products are discovered by \npeople simply happening upon them \nwhile being out and about in the \nworld.'**
  String get msg_many_new_products;

  /// No description provided for @lbl_shopping_cart.
  ///
  /// In en, this message translates to:
  /// **'Shopping Cart'**
  String get lbl_shopping_cart;

  /// No description provided for @lbl_change_address.
  ///
  /// In en, this message translates to:
  /// **'Change Address'**
  String get lbl_change_address;

  /// No description provided for @lbl_notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get lbl_notification;

  /// No description provided for @msg_shop_by_category.
  ///
  /// In en, this message translates to:
  /// **'Shop By Category'**
  String get msg_shop_by_category;

  /// No description provided for @lbl_enter_full_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get lbl_enter_full_name;

  /// No description provided for @msg_by_signing_below.
  ///
  /// In en, this message translates to:
  /// **'By signing below, you agree to the Team of use\nand privacy notice'**
  String get msg_by_signing_below;

  /// No description provided for @lbl_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get lbl_full_name;

  /// No description provided for @msg_delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get msg_delivery_address;

  /// No description provided for @msg_don_t_receive_a2.
  ///
  /// In en, this message translates to:
  /// **'Don’t receive a OTP? '**
  String get msg_don_t_receive_a2;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @theme_mode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get theme_mode;

  /// No description provided for @fonts.
  ///
  /// In en, this message translates to:
  /// **'Fonts'**
  String get fonts;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'system'**
  String get system;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @terms_of_services.
  ///
  /// In en, this message translates to:
  /// **'Terms of Services'**
  String get terms_of_services;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @give_us_feedbacks.
  ///
  /// In en, this message translates to:
  /// **'Give Us Feedbacks'**
  String get give_us_feedbacks;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// No description provided for @plan_your_trips.
  ///
  /// In en, this message translates to:
  /// **'Plan your trips'**
  String get plan_your_trips;

  /// No description provided for @book_one_of_your.
  ///
  /// In en, this message translates to:
  /// **'book one of your unique hotel to\nescape the ordinary'**
  String get book_one_of_your;

  /// No description provided for @find_best_deals.
  ///
  /// In en, this message translates to:
  /// **'Find best deals'**
  String get find_best_deals;

  /// No description provided for @find_deals_for_any.
  ///
  /// In en, this message translates to:
  /// **'Find deals for any season from cosy\ncountry homes to city flats'**
  String get find_deals_for_any;

  /// No description provided for @best_traveling_all_time.
  ///
  /// In en, this message translates to:
  /// **'Best traveling all time'**
  String get best_traveling_all_time;

  /// No description provided for @best_hotel_deals.
  ///
  /// In en, this message translates to:
  /// **'The best hotel deals for your vacation.'**
  String get best_hotel_deals;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @setting_text.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting_text;

  /// No description provided for @selected_fonts.
  ///
  /// In en, this message translates to:
  /// **'Selected fonts'**
  String get selected_fonts;

  /// No description provided for @selected_color.
  ///
  /// In en, this message translates to:
  /// **'Selected color'**
  String get selected_color;

  /// No description provided for @selected_language.
  ///
  /// In en, this message translates to:
  /// **'Selected language'**
  String get selected_language;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @no_internet.
  ///
  /// In en, this message translates to:
  /// **'No Internet connection'**
  String get no_internet;

  /// No description provided for @emailCannotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailCannotEmpty;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address, abc@xyz.com'**
  String get enterValidEmail;

  /// No description provided for @passwordCannotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passwordCannotEmpty;

  /// No description provided for @validPasswordLogin.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get validPasswordLogin;

  /// No description provided for @fullNameCannotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get fullNameCannotEmpty;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @confirm_password_must_be_same.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password must be same as Password'**
  String get confirm_password_must_be_same;

  /// No description provided for @valid_phone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number without spaces'**
  String get valid_phone;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['af', 'ar', 'de', 'en', 'es', 'fr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af': return AppLocalizationsAf();
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
