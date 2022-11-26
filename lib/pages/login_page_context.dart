import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularioapp/widgets/card_container.dart';
import 'package:formularioapp/widgets/widgets.dart';

class LoginPageContext extends StatelessWidget {
  const LoginPageContext({super.key});

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
                    _LoginForm()
                  ]
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}

//* Una clase para el formulario Statelesswidget

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                //* null cuando la validacion es correcta
                //* retornamos un String cuando la validación no paso
                return regExp.hasMatch(value ?? '') ? null: 'Lo ingresado no es correo electronico';
              },
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}