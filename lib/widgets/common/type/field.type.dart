enum FieldType { text, password }

typedef ValidateFunction = String? Function(String?);

typedef ConfirmPasswordValidateFunction = String? Function(String?, String?);
