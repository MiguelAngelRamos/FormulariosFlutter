import 'package:flutter/material.dart';
import 'package:formularioapp/provider/login_form_provider.dart';
import 'package:formularioapp/ui/styledecorations_input.dart';
import 'package:formularioapp/widgets/card_container.dart';
import 'package:formularioapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        //* SingleChildScrollView nos va permitir hacer scroll cuando sus hijos sobrepasen el alto del dispositivo
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30),
                    //* formulario
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm() //* solo el _LoginForm va tener acceso al provider LoginFormProvider
                    )
                    
                  ]
                ),
              ),
              const SizedBox(height: 50),
              const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

//* Una clase para el formulario Statelesswidget

class _LoginForm extends StatelessWidget {
  // const _LoginForm({super.key});
 
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    // loginForm.isValidForm();
    return Container(
      child: Form(
        key: loginForm.formKey, //! teniamos que utilizar la llave para que detecte  lo detecte el GlobalKey
        autovalidateMode: AutovalidateMode.onUserInteraction, //* valida a medida que el usuario va escribiendo
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => loginForm.email = value,
              decoration: StyleDecorationsInput.loginInputDecoration(
                hintextArgs: 'example@correo.com',
                labelTextArgs: 'Correo electronico',
                prefixIconArgs: Icons.alternate_email_rounded
              ),
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                //* null cuando la validacion es correcta
                //* retornamos un String cuando la validación no paso
                return regExp.hasMatch(value ?? '') ? null: 'Lo ingresado no es correo electronico';
              },
            ),
            TextFormField(
              obscureText: true,
               onChanged: (value) => loginForm.password = value,
              decoration: StyleDecorationsInput.loginInputDecoration(
                hintextArgs: "********", 
                labelTextArgs: "Contraseña",
                prefixIconArgs: Icons.lock_outline
              ),
              validator: (value) {
                value = value?.replaceAll(' ', '');
                return (value != null && value.length >= 6) ? null: 'La contraseña debe ser de minimo 6 caracteres';
              }
            ),
            const SizedBox(height: 30),
            MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  onPressed: () {
                    print(loginForm.isValidForm());
                    if(!loginForm.isValidForm()) return;
                    print('formulario completamente valido, uso de provider');
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: const Text('Ingresar', style: TextStyle(color: Colors.white)))
             )
          ],
        ),
      ),
    );
  } // builder

}