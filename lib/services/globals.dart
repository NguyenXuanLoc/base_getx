library app.globals;

import 'package:docsify/data/model/doctor_model.dart';

String accessToken = '';
String avatar = '';
String deviceId = '';
String deviceName = '';
String deviceModel = '';
String accountId = '';

bool isLogin = false;
int timePackageRemaining = 0;
int timeOut = 30;
String urlAvatarError =
    'https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png';

var listDoctorSuggest = [
  const InfoDoctorModel(
      id: 1, name: 'Teeth', avatar: 'a', specialization: 'Specialization'),
  const InfoDoctorModel(
      id: 1, name: 'Allergist', avatar: 'a', specialization: 'Specialization')
];

var listSuggestion = {
  "Dentist",
  'Practitioner',
  'Gynecologist',
  'Surgeon',
  'Psychologist',
  'Orthopedist',
  'Pediatrician',
  'Physiotherapist',
  'Dermatologist',
  'More',
};
