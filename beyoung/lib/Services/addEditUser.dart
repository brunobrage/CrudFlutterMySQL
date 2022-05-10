import 'package:beyoung/Services/userService.dart';
import 'package:flutter/material.dart';
import 'package:beyoung/models/users.dart';
import 'package:email_validator/email_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddEditUser extends StatefulWidget {
  final Clientes clientes;
  final int index;

  // ignore: use_key_in_widget_constructors
  const AddEditUser({this.clientes, this.index});

  @override
  _AddEditUserState createState() => _AddEditUserState();
}

final _formKey = GlobalKey<FormState>();

class _AddEditUserState extends State<AddEditUser> {
  final TextEditingController _nome_clientes = TextEditingController();
  final TextEditingController _email_clientes = TextEditingController();
  final TextEditingController _cpf_clientes = TextEditingController();
  final TextEditingController _cep_clientes = TextEditingController();

  bool _isValid = false;
  bool editMode = false;

  add(Clientes clientes) async {
    await UserService().addUser(clientes).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cliente adicionado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  update(Clientes clientes) async {
    await UserService().updateUser(clientes).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cliente atualizado!")),
      );
      Navigator.pop(context);
    });
    //print("Cidadão Adicionado!");
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      _nome_clientes.text = widget.clientes.nome_clientes;
      _email_clientes.text = widget.clientes.email_clientes;
      _cpf_clientes.text = widget.clientes.cpf_clientes;
      _cep_clientes.text = widget.clientes.cep_clientes;
    }
  }

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            centerTitle: true,
            title: Text(editMode ? "Atualizar" : "Cadastrar"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _nome_clientes,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Digite o Nome',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um Nome';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _email_clientes,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Digite o Email',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ],
                        textAlign: TextAlign.center,
                        controller: _cpf_clientes,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Digite o CPF',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um CPF';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 10, right: 10),
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter()
                        ],
                        textAlign: TextAlign.center,
                        controller: _cep_clientes,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Digite o CEP',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 5),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Por Favor Digite um CEP';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String cpf = _cpf_clientes.text;
                        if(GetUtils.isCpf(cpf)){

                        
                        _isValid =
                            EmailValidator.validate(_email_clientes.text);
                        if (_isValid) {
                          if (_formKey.currentState.validate()) {
                            if (editMode) {
                              Clientes clientes = Clientes(
                                id_clientes: widget.clientes.id_clientes,
                                nome_clientes: _nome_clientes.text,
                                email_clientes: _email_clientes.text,
                                cpf_clientes: _cpf_clientes.text,
                                cep_clientes: _cep_clientes.text,
                              );
                              update(clientes);
                            } else {
                              Clientes clientes = Clientes(
                                nome_clientes: _nome_clientes.text,
                                email_clientes: _email_clientes.text,
                                cpf_clientes: _cpf_clientes.text,
                                cep_clientes: _cep_clientes.text,
                              );
                              add(clientes);
                            }
                          }
                        } else if (_email_clientes.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Favor preencher Email")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Email Inválido")),
                          );
                        }
                        }else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("CPF Inválido")),
                          );
                        }
                      },
                      child: Text(editMode ? "Atualizar" : "Cadastrar"),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
