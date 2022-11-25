import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _createCardShape(),
      child: this.child,
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 20, //* intesidad de la sombra
        offset: Offset(0,5) //* para bajar o subir la sombra en los ejes x,y
      )
    ]
  );
}