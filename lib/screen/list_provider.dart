import 'package:flutter/material.dart';
import 'package:examen/models/provider.dart';
import 'package:examen/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:examen/screen/screen.dart';
import 'package:examen/services/services.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);
    if (providerService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.proveedores.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            providerService.selectProvider =
                providerService.proveedores[index].copy();
            Navigator.pushNamed(context, 'edit-product');
          },
          child: ProviderCard(proveedor: providerService.proveedores[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          providerService.selectProvider = Listado(
              providerName: '',
              providerLastName: '',
              providerMail: '',
              providerState: '');
          Navigator.pushNamed(context, 'edit-product');
        },
      ),
    );
  }
}
