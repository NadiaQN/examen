import 'package:flutter/material.dart';
import 'package:examen/models/categorias.dart';
import 'package:examen/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:examen/screen/screen.dart';
import 'package:examen/services/services.dart';

class ListCategoriesScreen extends StatelessWidget {
  const ListCategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoriesService = Provider.of<CategoriesService>(context);
    if (categoriesService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorias'),
      ),
      body: ListView.builder(
        itemCount: categoriesService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoriesService.selectCategories =
                categoriesService.categories[index].copy();
            Navigator.pushNamed(context, 'edit-product');
          },
          child:
              CategoriesCard(categorias: categoriesService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoriesService.selectCategories =
              Listado(categoryId: 0, categoryName: '', categoryState: '');
          Navigator.pushNamed(context, 'edit-product');
        },
      ),
    );
  }
}
