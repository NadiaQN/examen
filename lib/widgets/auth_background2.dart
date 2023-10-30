import 'package:flutter/material.dart';

class AuthBackground2 extends StatelessWidget {
  const AuthBackground2({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen =
        MediaQuery.of(context).size; //obtiene el tamaño de la pantalla
    return Container(
        width: double.infinity,
        height: sizeScreen.height * 0.4, //40% de la pantalla
        decoration: purpleDecoration());
  }

  BoxDecoration purpleDecoration() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(131, 8, 255, 1),
        Color.fromRGBO(132, 8, 132, 1),
      ]));
}
