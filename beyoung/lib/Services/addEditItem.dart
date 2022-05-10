import 'package:beyoung/Services/itensService.dart';
import 'package:flutter/material.dart';
import 'package:beyoung/models/itens.dart';

class AddEditItens extends StatefulWidget {
  final Item itens;
  final int index;

  const AddEditItens({this.itens, this.index});

  @override
  _AddEditItensState createState() => _AddEditItensState();
}

class _AddEditItensState extends State<AddEditItens> {
  final TextEditingController _nome_itens = TextEditingController();
  final TextEditingController _itens_sku = TextEditingController();
  final TextEditingController _itens_descricao = TextEditingController();
  final TextEditingController _itens_valor = TextEditingController();
  final TextEditingController _itens_quantidade = TextEditingController();

  bool editMode = false;

  add(Item itens) async {
    await ItensService().addItens(itens).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Produto adicionado!")),
      );
      Navigator.pop(context);
    });
    //print("Item Adicionado!");
  }

  update(Item itens) async {
    await ItensService().updateItens(itens).then((success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Produto Atualizado!")),
      );
      Navigator.pop(context);
    });
    //  print("Item Atualizado!");
  }

  @override
  void initState() {
    super.initState();
    if (widget.itens != null) {
      editMode = true;
      _nome_itens.text = widget.itens.nome_itens;
      _itens_sku.text = widget.itens.itens_sku;
      _itens_descricao.text = widget.itens.itens_descricao;
      _itens_valor.text = widget.itens.itens_valor;
      _itens_quantidade.text = widget.itens.itens_quantidade;
    }
  }

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          centerTitle: true,
          title: Text(editMode ? "Atualizar" : "Cadastrar"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _nome_itens,
                      decoration: const InputDecoration(
                        hintText: 'Qual o nome?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _itens_sku,
                      decoration: const InputDecoration(
                        hintText: 'Qual o sku?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _itens_descricao,
                      decoration: const InputDecoration(
                        hintText: 'Qual a descrição?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _itens_valor,
                      decoration: const InputDecoration(
                        hintText: 'Qual o valor?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 30.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _itens_quantidade,
                      decoration: const InputDecoration(
                        hintText: 'Quantos Itens?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (editMode) {
                        Item itens = Item(
                          id_itens: widget.itens.id_itens,
                          nome_itens: _nome_itens.text,
                          itens_sku: _itens_sku.text,
                          itens_descricao: _itens_descricao.text,
                          itens_valor: _itens_valor.text,
                          itens_quantidade: _itens_quantidade.text,
                        );
                        update(itens);
                      } else {
                        if (_nome_itens.text.isEmpty) {
                          // ignore: prefer_const_constructors
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Este campo é obrigatório")),
                          );
                        } else {
                          Item itens = Item(
                            nome_itens: _nome_itens.text,
                            itens_sku: _itens_sku.text,
                            itens_descricao: _itens_descricao.text,
                            itens_valor: _itens_valor.text,
                            itens_quantidade: _itens_quantidade.text,
                          );
                          add(itens);
                        }
                      }
                    },
                    child: Text(editMode ? "Atualizar" : "Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
