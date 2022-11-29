import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //* el GlobalKey nos va permitir obtener las referencias del tipo
  //* para este caso "FormState"
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String? email = '';
  String? password = '';

  //* metodo que accesa el validate
  bool isValidForm() {
    print(formKey.currentState?.validate());
    print('email: $email - password: $password');
    return formKey.currentState?.validate() ?? false;
  }
}