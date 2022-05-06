import 'dart:ui';

import 'package:get/get.dart';

class AppTranslation extends Translations {
  static var fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'pl': Locales.pl,
        'vi': Locales.vi_VN,
        'en': Locales.en,
      };
}

class LocaleKeys {
  LocaleKeys._();

  static const ask_existing_page = 'ask_existing_page';
  static const have_account = 'have_account';
  static const email_address = 'email_address';
  static const pass = 'pass';
  static const forgot_pass = 'forgot_pass';
  static const login = 'login';
  static const here_for_first_time = 'here_for_first_time';
  static const create_account = 'create_account';
  static const contact = 'contact';
  static const regulation = 'regulation';
  static const cookies = 'cookies';
  static const privacy = 'privacy';
  static const please_input_email = 'please_input_email';
  static const please_input_valid_email = 'please_input_valid_email';
  static const please_input_pass = 'please_input_pass';
  static const please_input_valid_pass = 'please_input_valid_pass';
  static const pass_and_confirm_pass_not_match =
      "pass_and_confirm_pass_not_match";
  static const please_enter_confirm_pass = 'please_enter_confirm_pass';
  static const network_error = 'network_error';
  static const login_success = 'login_success';
  static const account_not_exist = 'account_not_exist';
  static const app_name = "app_name";
  static const input_email_to_reset_pass = "input_email_to_reset_pass";
  static const sent = 'sent';
  static const retype_pass = 'retype_pass';
  static const register = 'register';
  static const register_with = 'register_with';
  static const register_step1 = 'register_step1';
  static const register_step2 = 'register_step2';
  static const enter = 'enter';
  static const full_name = 'full_name';
  static const phone_number = 'phone_number';
  static const birth_date = 'birth_date';
  static const i_agree_term = 'i_agree_term';
  static const please_input_your_name = 'please_input_your_name';
  static const please_input_phone_number = 'please_input_phone_number';
  static const please_input_date_of_birth = 'please_input_date_of_birth';
  static const please_input_valid_phone_number =
      'please_input_valid_phone_number';
}

class Locales {
  static const en = {
    'ask_existing_page': 'EnglishEnglishEnglishEnglishEnglish',
    'have_account': 'I already have an account',
    'email_address': 'Email address',
    'pass': 'Password',
    'forgot_pass': 'Forgot Password',
    'login': 'Login',
    'here_for_first_time': "I'm here for first time",
    'create_account': 'Create an Organize account',
    'contact': 'Contact',
    'regulation': 'Regulation',
    'cookies': 'Cookies',
    'privacy': 'Privacy policy',
    'please_input_email': 'Please enter your Email',
    'please_input_valid_email': 'Please enter valid Email',
    'please_input_pass': 'Please enter your Password',
    'please_input_valid_pass': 'Please enter valid Password',
    'pass_and_confirm_pass_not_match':
        'Password and confirm password not matched',
    'please_enter_confirm_pass': 'Please enter Confirm Password',
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.',
    'app_name': 'Docsify',
    'sent': 'Sent',
    'register': 'Register',
    'register_with': 'Register with',
    'register_step2': 'Register step 2/2',
    'register_step1': 'Register step 1/2',
    'retype_pass': 'Retype Password',
    'enter': 'Enter',
    'full_name': 'Full Name',
    'phone_number': 'Phone Number',
    'i_agree_term': 'I agree with term and\nconditions',
    'birth_date': 'Birth Date',
    'input_email_to_reset_pass':
        'Please input your email in order to reset your password',
    'please_input_your_name': 'Please enter your Name',
    'please_input_phone_number': 'Please enter your phone number',
    'please_input_date_of_birth': 'Please enter your Date of birth',
    'please_input_valid_phone_number': 'Please enter valid phone number',
  };

  static const vi_VN = {
    'ask_existing_page': 'Việt Nam',
    'have_account': 'I already have an account',
    'email_address': 'Email address',
    'pass': 'Password',
    'forgot_pass': 'Fogot Password',
    'login': 'Login',
    'here_for_first_time': "I'm here for first time",
    'create_account': 'Create an Organize account',
    'contact': 'Contact',
    'regulation': 'Regulation',
    'cookies': 'Cookies',
    'privacy': 'Privacy policy',
    'please_input_email': 'Please enter your Email',
    'please_input_valid_email': 'Please enter valid Email',
    'please_input_pass': 'Please enter your Password',
    'please_input_valid_pass': 'Please enter valid Password',
    'pass_and_confirm_pass_not_match':
        'Password and confirm password not matched',
    'please_enter_confirm_pass': 'Please enter Confirm Password',
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.',
    'app_name': 'Docsify',
    'sent': 'Sent',
    'register': 'Register',
    'register_with': 'Register with',
    'register_step2': 'Register step 2/2',
    'register_step1': 'Register step 1/2',
    'retype_pass': 'Retype Password',
    'enter': 'Enter',
    'full_name': 'Full Name',
    'phone_number': 'Phone Number',
    'birth_date': 'Birth Date',
    'i_agree_term': 'I agree with term and\nconditions',
    'input_email_to_reset_pass':
        'Please input your email in order to reset your password',
    'please_input_your_name': 'Please enter your Name',
    'please_input_phone_number': 'Please enter your phone number',
    'please_input_date_of_birth': 'Please enter your Date of birth',
    'please_input_valid_phone_number': 'Please enter valid phone number',
  };

  static const pl = {
    'ask_existing_page': 'Balan',
    'have_account': 'I already have an account',
    'email_address': 'Email address',
    'pass': 'Password',
    'forgot_pass': 'Fogot Password',
    'login': 'Login',
    'here_for_first_time': "I'm here for first time",
    'create_account': 'Create an Organize account',
    'contact': 'Contact',
    'regulation': 'Regulation',
    'cookies': 'Cookies',
    'privacy': 'Privacy policy',
    'please_input_email': 'Please enter your Email',
    'please_input_valid_email': 'Please enter valid Email',
    'please_input_pass': 'Please enter your Password',
    ' please_input_valid_pass ': 'Please enter valid Password',
    'pass_and_confirm_pass_not_match':
        'Password and confirm password not matched',
    'please_enter_confirm_pass': 'Please enter Confirm Password',
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.',
    'app_name': 'Docsify',
    'sent': 'Sent',
    'register': 'Register',
    'register_with': 'Register with',
    'retype_pass': 'Retype Password',
    'register_step2': 'Register step 2/2',
    'register_step1': 'Register step 1/2',
    'enter': 'Enter',
    'full_name': 'Full Name',
    'phone_number': 'Phone Number',
    'birth_date': 'Birth Date',
    'i_agree_term': 'I agree with term and\nconditions',
    'input_email_to_reset_pass':
        'Please input your email in order to reset your password',
    'please_input_your_name': 'Please enter your Name',
    'please_input_phone_number': 'Please enter your phone number',
    'please_input_date_of_birth': 'Please enter your Date of birth',
    'please_input_valid_phone_number': 'Please enter valid phone number',
  };
}
