import 'package:flutter/material.dart';
import 'package:examen/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'options': (BuildContext context) => const OptionsScreen(),
    'list-product': (BuildContext context) => const ListProductScreen(),
    'list-provider': (BuildContext context) => const ListProviderScreen(),
    'list-categories': (BuildContext context) => const ListCategoriesScreen(),
    'edit-product': (BuildContext context) => const EditProductScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
