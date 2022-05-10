class Item {
  String id_itens;
  String nome_itens;
  String itens_sku;
  String itens_descricao;
  String itens_valor;
  String itens_quantidade;

  Item(
      { this.id_itens,
       this.nome_itens,
       this.itens_sku,
       this.itens_descricao,
       this.itens_valor,
       this.itens_quantidade});

  factory Item.fromjson(Map<String, dynamic> json) {
    return Item(
      id_itens: json['id_itens'] as String,
      nome_itens: json['nome_itens'] as String,
      itens_sku: json['itens_sku'] as String,
      itens_descricao: json['itens_descricao'] as String,
      itens_valor: json['itens_valor'] as String,
      itens_quantidade: json['itens_quantidade'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "id_itens": id_itens != null ? id_itens.toString(): '',
      "nome_itens": nome_itens!= null ? nome_itens.toString(): '',
      "itens_sku": itens_sku!= null ? itens_sku.toString(): '',
      "itens_descricao": itens_descricao!= null ? itens_descricao.toString(): '',
      "itens_valor": itens_valor!= null ? itens_valor.toString(): '',
      "itens_quantidade": itens_quantidade!= null ? itens_quantidade.toString(): '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id_itens": id_itens,
      "nome_itens": nome_itens,
      "itens_sku": itens_sku,
      "itens_descricao": itens_descricao,
      "itens_valor": itens_valor,
      "itens_quantidade": itens_quantidade,
    };
  }
}
