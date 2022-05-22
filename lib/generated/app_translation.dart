import 'dart:ui';

import 'package:get/get.dart';

class AppTranslation extends Translations {
  static var fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'pl': Locales.en,
        'vi': Locales.en,
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
  static const contact_email = 'contact_email';
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
  static const business_name = 'business_name';
  static const phone_number = 'phone_number';
  static const birth_date = 'birth_date';
  static const i_agree_term = 'i_agree_term';
  static const please_input_your_name = 'please_input_your_name';
  static const please_input_phone_number = 'please_input_phone_number';
  static const please_input_date_of_birth = 'please_input_date_of_birth';
  static const please_input_valid_phone_number =
      'please_input_valid_phone_number';
  static const register_success = "register_success";
  static const message_sent_active_code = "message_sent_active_code";
  static const fill_active_code_here = "fill_active_code_here";
  static const active = "active";
  static const dont_receive_email = "dont_receive_email";
  static const click_here_to_resend = "click_here_to_resend";
  static const please_input_your_code = 'please_input_your_code';
  static const please_input_valid_code = 'please_input_valid_code';
  static const go_to_provider = 'go_to_provider';
  static const or = 'or';
  static const facebook = 'facebook';
  static const google = 'google';
  static const user_zone = 'user_zone';
  static const logout = 'logout';
  static const offline = 'offline';
  static const online = 'online';
  static const category_or_doctor_name = 'category_or_doctor_name';
  static const fill_doctor = 'fill_doctor';
  static const doctors = 'doctors';
  static const lastest_rating = 'lastest_rating';
  static const search = 'search';
  static const how_to_work = 'how_to_work';
  static const step = 'step';
  static const hello_can_i_help_u = 'hello_can_i_help_u';
  static const input_specialist_or_doctor_name =
      'input_specialist_or_doctor_name';
  static const featured_doctor = 'featured_doctor';
  static const reservation = 'reservation';
  static const favourite = 'favourite';
  static const address = 'address';
  static const activity_list = 'activity_list';
  static const full_name = 'full_name';
  static const ok = 'ok';
  static const not_result = 'not_result';
  static const please_input_keyword = 'please_input_keyword';
  static const more = 'more';
  static const less = 'less';
  static const are_you_sure_want_to_quit = 'are_you_sure_want_to_quit';
  static const your_information_will_not_be_saved =
      'your_information_will_not_be_saved';
  static const cancel = 'cancel';
  static const quit = 'quit';
  static const notify = 'notify';
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
    'create_account': 'Create an account',
    'contact': 'Contact',
    'contact_email': 'Contact Email',
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
    'sent': 'Send',
    'register': 'Register',
    'register_with': 'Register with',
    'register_step2': 'Register step 2/2',
    'register_step1': 'Register step 1/2',
    'retype_pass': 'Retype Password',
    'enter': 'Enter',
    'business_name': 'Business name',
    'phone_number': 'Phone Number',
    'i_agree_term': 'Accept Terms......',
    'birth_date': 'Birth Date',
    'input_email_to_reset_pass':
        'Please input your email in order to reset your password',
    'please_input_your_name': 'Please enter your Name',
    'please_input_phone_number': 'Please enter your phone number',
    'please_input_date_of_birth': 'Please enter your Date of birth',
    'please_input_valid_phone_number': 'Please enter valid phone number',
    'register_success': 'Register\nsuccessful',
    'message_sent_active_code':
        'We have sent activation code to your email. Please check and fill bellow to activate your account',
    'fill_active_code_here': 'Fill activation code here',
    'active': 'Activate',
    'dont_receive_email': 'You dont receive email ?',
    'click_here_to_resend': 'Click here to resend',
    'please_input_your_code': 'Please input your code',
    'please_input_valid_code': 'Please input valid code',
    'go_to_provider': 'Go to provider',
    'or': '  Or  ',
    'facebook': 'Facebook',
    'google': 'Google',
    'user_zone': 'User Zone',
    'logout': 'Logout',
    'offline': 'Offline',
    'online': 'Online',
    'category_or_doctor_name': 'Category or Doctor Name',
    'fill_doctor': 'Fill a doctor',
    'doctors': 'Doctor',
    'lastest_rating': 'Lastest rating',
    'search': 'Search',
    'how_to_work': 'How to work?',
    'step': 'Step',
    'hello_can_i_help_u': 'Hello\nHow can i help you',
    'input_specialist_or_doctor_name': 'Input specialist or doctor name',
    'featured_doctor': 'Feature doctor',
    'reservation': 'Reservation',
    'favourite': 'Favourite',
    'address': 'Address',
    'activity_list': 'Activities List',
    'full_name': 'Full Name',
    'ok': 'OK',
    'not_result': 'Not result',
    'please_input_keyword': 'Please input Keyword.',
    'more': 'More',
    'less': 'Less',
    'are_you_sure_want_to_quit': 'Are you sure want to quit ?',
    'your_information_will_not_be_saved': 'Your information will not be saved',
    'cancel': 'Cancel',
    'quit': 'Quit',
    'notify': 'Notify',
  };
}
