String? validationMobile(String? mobile) {
  if (isMobileValid(mobile!) && mobile.isNotEmpty) {
    return null;
  } else {
    return 'invalid_mobile_number';
  }
}

String? validatePhone(String? phone) {
  if (isPhoneValid(phone!)) {
    return null;
  } else {
    return 'invalid_phone_number';
  }
}

String? validateHasValue(String? input) {
  if (isNotEmpty(input)) {
    return null;
  } else {
    return 'required_information';
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

bool isPhoneValid(String phoneNumber) {
  String phonePattern = r'^(\\+98|0)?9\\d{9}$';
  RegExp phoneRegex = RegExp(phonePattern);
  return phoneRegex.hasMatch(phoneNumber);
}

bool isNotEmpty(String? inputValue) {
  if (inputValue == null || inputValue.isEmpty) {
    return false;
  } else {
    return true;
  }
}
