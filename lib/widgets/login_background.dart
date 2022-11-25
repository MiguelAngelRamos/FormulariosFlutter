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
          _GreenBox(),
          _HeaderIcon()
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
      decoration: _greenBackGroundDecoration(),
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: _Bubble()),
          Positioned(top: -40, left: -30, child: _Bubble()),
          Positioned(top: -50, right: -20, child: _Bubble()),
          Positioned(bottom: -50, left: 10, child: _Bubble()),
          Positioned(bottom: 120, right: 20, child: _Bubble()),
        ],
      ),
    );
  }
  BoxDecoration _greenBackGroundDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 63, 156, 85),
        Color.fromARGB(255, 93, 180, 120)
      ]
      )
  );

}

//* Nuestra forma Bubble
class _Bubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.08)
      ),
    );
  }
}


//* Icono del Header

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        // height: 200,
        // color: Colors.yellow,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}