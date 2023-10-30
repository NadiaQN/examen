import 'package:examen/services/services.dart';
import 'package:examen/ui/input_decorations.dart';
import 'package:examen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen/providers/providers.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
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
                  'Registrate',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const RegisterForm()),
                const SizedBox(height: 50),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'login'),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.purple.withOpacity(0.1)),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: const Text('Ya tienes cuenta, ingresa')),
              ],
            ))
          ],
        ),
      )),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
            prefixIcon: Icons.people,
          ),
          onChanged: (value) => LoginForm.email = value,
          validator: (value) {
            return (value != null && value.length >= 4)
                ? null
                : 'El usuario no puede estar vacio';
          },
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDEcorations.authInputDecoration(
            hintText: '************',
            labelText: 'Password',
            prefixIcon: Icons.lock_outline,
          ),
          onChanged: (value) => LoginForm.password = value,
          validator: (value) {
            return (value != null && value.length >= 4)
                ? null
                : 'La contraseña no puede estar vacio';
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
          onPressed: LoginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  if (!LoginForm.isValidForm()) return;
                  LoginForm.isLoading = true;
                  final String? errorMessage = await authService.create_user(
                      LoginForm.email, LoginForm.password);
                  if (errorMessage == null) {
                    Navigator.pushNamed(context, 'login');
                  } else {
                    print(errorMessage);
                  }
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: const Text(
              'Registrar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
