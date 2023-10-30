import 'package:examen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: 300),
      child: const Column(
        children: [
          ButtonOptions(text: 'Ver Productos', redirection: 'list-product'),
          ButtonOptions(text: 'Ver Proveedores', redirection: 'list-provider'),
          ButtonOptions(text: 'Ver Categorias', redirection: 'list-categories')
        ],
      ),
    );
  }
}
