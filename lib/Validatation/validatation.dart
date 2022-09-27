String? validateMobile(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length < 10) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  } else if (value.substring(1, 2) == "05") {
    return 'Please enter valid mobile number';
  }
  return null;
}
