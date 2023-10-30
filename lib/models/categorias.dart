import 'dart:convert';

class Categorias {
  List<Listado> listado;

  Categorias({
    required this.listado,
  });

  factory Categorias.fromJson(String str) =>
      Categorias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categorias.fromMap(Map<String, dynamic> json) => Categorias(
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  int categoryId;
  String categoryName;
  String categoryState;

  Listado({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_state": categoryState,
      };

  Listado copy() => Listado(
      categoryId: categoryId,
      categoryName: categoryName,
      categoryState: categoryState);
}
