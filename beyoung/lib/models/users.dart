class Clientes {
  String id_clientes;
  String nome_clientes;
  String email_clientes;
  String cpf_clientes;
  String cep_clientes;

  Clientes(
      {this.id_clientes,
      this.nome_clientes,
      this.email_clientes,
      this.cpf_clientes,
      this.cep_clientes});

  factory Clientes.fromjson(Map<String, dynamic> json) {
    return Clientes(
      id_clientes: json['id_clientes'] as String,
      nome_clientes: json['nome_clientes'] as String,
      email_clientes: json['email_clientes'] as String,
      cpf_clientes: json['cpf_clientes'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "nome_clientes": nome_clientes != null ? nome_clientes.toString() : '',
      "email_clientes": email_clientes != null ? email_clientes.toString() : '',
      "cpf_clientes": cpf_clientes != null ? cpf_clientes.toString() : '',
      "cep_clientes": cep_clientes != null ? cep_clientes.toString() : '',
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id_clientes": id_clientes != null ? id_clientes.toString() : '',
      "nome_clientes": nome_clientes != null ? nome_clientes.toString() : '',
      "email_clientes": email_clientes != null ? email_clientes.toString() : '',
      "cpf_clientes": cpf_clientes != null ? cpf_clientes.toString() : '',
      "cep_clientes": cep_clientes != null ? cep_clientes.toString() : '',
    };
  }
}
