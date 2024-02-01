
class ConstValue {
  final String webApis = "https://www.emsifa.com/api-wilayah-indonesia/api/";
}

class FormValidation {
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Please insert your First name';
    } else if (value.length < 3) {
      return 'Please insert your First name more than 3 characters';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Please insert your Last name';
    } else if (value.length < 3) {
      return 'Please insert your Last name more than 3 characters';
    }
    return null;
  }

  String? validateEmpty(String value) {
    if (value.isEmpty) {
      return 'Please insert your Biodata';
    }
    return null;
  }
  
}