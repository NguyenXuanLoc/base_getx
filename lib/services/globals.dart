library app.globals;

String accessToken = '';
String deviceId = '';
String deviceName = '';
String deviceModel = '';
String accountId = '';

bool isLogin = false;
int timePackageRemaining = 0;
int timeOut = 30;

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
