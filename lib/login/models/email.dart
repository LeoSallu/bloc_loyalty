import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid, unknown }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
