import 'package:examen/providers/providers.dart';
import 'package:examen/ui/input_decorations.dart';
import 'package:examen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            CardContainer(
                child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Ingresa',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const LoginForm()),
                const SizedBox(height: 50),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'register'),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.purple.withOpacity(0.1)),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: const Text('No tienes cuenta, Registrate')),
              ],
            ))
          ],
        ),
      )),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: LoginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDEcorations.authInputDecoration(
              hintText: 'Ingrese su correo',
              labelText: 'Email',
              prefixIcon: Icons.people),
          onChanged: (value) => LoginForm.email = value,
          validator: (value) {
            return (value != null && value.length >= 4)
                ? null
                : 'El correo no puede estar vacio';
          },
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDEcorations.authInputDecoration(
              hintText: '****************',
              labelText: 'Password',
              prefixIcon: Icons.lock_outline),
          onChanged: (value) => LoginForm.password = value,
          validator: (value) {
            return (value != null && value.length >= 4)
                ? null
                : 'La contrasena no puede estar vacia';
          },
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledColor: Colors.grey,
          color: Colors.purple,
          elevation: 0,
          onPressed: () async {
            Navigator.pushNamed(context, 'options');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child:
                const Text('Ingresar', style: TextStyle(color: Colors.white)),
          ),
        )
      ]),
    );
  }
}
