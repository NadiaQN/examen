import 'package:flutter/material.dart';

class ButtonOptions extends StatelessWidget {
  final String text;
  final String redirection;
  const ButtonOptions(
      {super.key, required this.text, required this.redirection});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: Colors.grey,
      color: Colors.purple,
      elevation: 0,
      onPressed: () async {
        Navigator.pushNamed(context, redirection);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
