import 'package:iti_final_project/core/utils/shared_preferences.dart';

class Constants {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
}
