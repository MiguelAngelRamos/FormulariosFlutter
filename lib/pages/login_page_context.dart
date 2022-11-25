import 'package:flutter/material.dart';
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
                    const SizedBox(height: 30)
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