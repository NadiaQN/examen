import 'package:examen/widgets/auth_background2.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const AuthBackground2(),
          SafeArea(
              child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child:
                const Icon(Icons.pets_outlined, color: Colors.white, size: 100),
          )),
          child
        ],
      ),
    );
  }

  BoxDecoration purpleDecoration() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(131, 8, 255, 1),
        Color.fromRGBO(132, 8, 132, 1),
      ]));
}
