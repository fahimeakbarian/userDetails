String? validationMobile(String? mobile) {
  if (isMobileValid(mobile!) && mobile.isNotEmpty) {
    return null;
  } else {
    return 'invalid_mobile_number';
  }
}



bool isMobileValid(String mobileNumber) {
  //https://regex101.com/r/mhXP2g/2
  if (mobileNumber.length >= 11) {
    String mobilePattern = r'^(?:09)?[0-9]{9}$';
    RegExp mobileRegex = RegExp(mobilePattern);
    return mobileRegex.hasMatch(mobileNumber);
  } else {
    return false;
  }
}




