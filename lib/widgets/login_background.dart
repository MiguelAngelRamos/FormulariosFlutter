import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.indigo,
      //* Estas dimensiones van a ocupar el total del dispositivo
      //* en ancho y alto
      //* El Stack nos pemirte colocar un widget sobre otro
      child: Stack(
        children: [
          _GreenBox()
        ],
      ),
    );
  }
}

//* _GreenBox

class _GreenBox extends StatelessWidget {
  const _GreenBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //* tomamos la dimensiones del dispositivo
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _greenBackGroundDecoration()
    );
  }
  BoxDecoration _greenBackGroundDecoration() => BoxDecoration(
    
  );

}