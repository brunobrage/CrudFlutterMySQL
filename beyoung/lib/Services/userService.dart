import 'dart:convert';
import '../models/users.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const ADD_URL = 'https://192.168.0.103/BeyoungDB/addUser.php';
  static const VIEW_URL = 'https://192.168.0.103/BeyoungDB/viewUser.php';
  static const UPDATE_URL = 'https://192.168.0.103/BeyoungDB/updateUser.php';
  static const DELETE_URL = 'https://192.168.0.103/BeyoungDB/deleteUser.php';

  Future<String> addUser(Clientes clientes) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: clientes.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Clientes> userFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Clientes>.from(data.map((clientes) => Clientes.fromjson(clientes)));
  }

  Future<List<Clientes>> getUser() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Clientes> list = userFromJson(response.body);
      return list;
    } else {
      return <Clientes>[];
    }
  }

  Future<String> updateUser(Clientes clientes) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: clientes.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deleteUser(Clientes clientes) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: clientes.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}
