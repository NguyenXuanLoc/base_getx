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
  static const network_error = 'network_error';
  static const login_success = 'login_success';
  static const account_not_exist = 'account_not_exist';
}

class Locales {
  static const en = {
    'ask_existing_page': 'EnglishEnglishEnglishEnglishEnglish',
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
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.'
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
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.'
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
    'network_error': 'Network error, please try again.',
    'login_success': 'Successfully logged in.'
  };
}
