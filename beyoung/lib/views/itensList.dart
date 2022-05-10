 
import 'package:beyoung/models/itens.dart';
import 'package:beyoung/Services/addEditItem.dart';
import 'package:beyoung/Services/itensService.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
   List<Item> itensList;

  bool loading = true;

  getAllItens() async {
    itensList = await ItensService().getItens();
    setState(() {
      loading = false;
    });
  //  print("itens : ${itensList.length}");
  }

  delete(Item itens) async {
    await ItensService().deleteItens(itens);
    setState(() {
      loading = false;
      getAllItens();
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Produto Deletado")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllItens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Itens'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditItens(
                  ),
                ),
              ).then((value) => getAllItens());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: itensList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Item itens = itensList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditItens(itens: itens, index: i,),
                        ),
                      ).then((value) => getAllItens());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(itens.itens_quantidade ),
                    ),
                    title: Text(itens.nome_itens),
                    subtitle: Text( itens.itens_valor + " BRL"),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Item'),
                              content: Text('Tem ceteza?'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Não'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                TextButton(
                                  child: Text('Sim'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                ),
                              ],
                            ),
                          ).then((confirmed) {
                            if (confirmed) {
                              delete(itens);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}