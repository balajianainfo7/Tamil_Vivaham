// ignore_for_file: override_on_non_overriding_member


import 'package:get_storage/get_storage.dart';
import 'package:thirumanam/preferences/pref_helper.dart';


class AppPreference extends PreferenceHelper {
  var pref = GetStorage("thirumanampref");


  removePreference() {
    pref.erase();
  }

  @override
  String? get userEmail => pref.read("userEmail") ?? "";

  @override
  set userEmail(String? userEmail) {
    pref.write("userEmail", userEmail);
  }

  @override
  String? get accessToken => pref.read("accessToken") ?? "";

  @override
  set accessToken(String? accessToken) {
    pref.write("accessToken", accessToken);
  }

  @override
  bool? get verified => pref.read("verified") ?? false;

  @override
  set verified(bool? verified) {
    pref.write("verified", verified);
  }


}
