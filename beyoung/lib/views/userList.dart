import 'package:beyoung/models/users.dart';
import 'package:beyoung/Services/addEditUser.dart';
import 'package:beyoung/Services/userService.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Clientes>clientesList;

  bool loading = true;

  getAllClientes() async {
   clientesList = await UserService().getUser();
    setState(() {
      loading = false;
    });
   // print("user : ${clientesList.length}");
  }

  delete(Clientes clientes) async {
    await UserService().deleteUser(clientes);
    setState(() {
      loading = false;
      getAllClientes();
    });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Cliente deletado!")),
      );
  }

  @override
  void initState() {
    super.initState();
    getAllClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Clientes'),
        actions: <Widget>[
          IconButton(
            
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditUser(),
                ),
              ).then((value) => getAllClientes());
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
                itemCount: clientesList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, i) {
                  Clientes clientes = clientesList[i];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddEditUser(clientes: clientes, index: i),
                        ),
                      ).then((value) => getAllClientes());
                    },
                    
                    leading: CircleAvatar(
                      child: Text(clientes.nome_clientes[0]),
                    ),
                    title: Text(clientes.nome_clientes),
                    subtitle: Text(clientes.cpf_clientes),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Excluir Cliente'),
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
                              delete(clientes);
                            }
                          });
                        }),
                  );
                }),
        
        ),
      
    );
  }
}