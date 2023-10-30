import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:examen/models/categorias.dart';

class CategoriesService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> categories = [];
  Listado? selectCategories;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoriesService() {
    loadCategories();
  }

  Future loadCategories() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/ ',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoriesMap = Categorias.fromJson(response.body);
    print(response.body);
    categories = categoriesMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategories(Listado categorias) async {
    isEditCreate = true;
    notifyListeners();
    if (categorias.categoryId == 0) {
      await createCategories(categorias);
    } else {
      await updateCategories(categorias);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateCategories(Listado categorias) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: categorias.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = categories
        .indexWhere((element) => element.categoryId == categorias.categoryId);
    categories[index] = categorias;

    return '';
  }

  Future createCategories(Listado categorias) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: categorias.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    categories.add(categorias);
    return '';
  }

  Future deleteCategories(Listado categorias, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: categorias.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    categories.clear();
    loadCategories();
    Navigator.of(context).pushNamed('list-categories');
    return '';
  }
}
