library app.globals;

String accessToken = '';
String deviceId = '';
String deviceName = '';
String deviceModel = '';
String accountId = '';

bool isLogin = false;
int timePackageRemaining = 0;
int timeOut = 30;
String urlAvatarError =
    'https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png';
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
