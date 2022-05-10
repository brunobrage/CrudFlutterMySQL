import 'dart:convert';
import '../models/itens.dart';
import 'package:http/http.dart' as http;

class ItensService {
  static const ADD_URL = 'https://192.168.0.103/BeyoungDB/Itens/add.php';
  static const VIEW_URL = 'https://192.168.0.103/BeyoungDB/Itens/view.php';
  static const UPDATE_URL = 'https://192.168.0.103/BeyoungDB/Itens/update.php';
  static const DELETE_URL = 'https://192.168.0.103/BeyoungDB/Itens/delete.php';

  Future<String> addItens(Item itens) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: itens.toJsonAdd());
    if (response.statusCode == 200) {
     // print("Add Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  List<Item> itensFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<Item>.from(data.map((item) => Item.fromjson(item)));
  }

  Future<List<Item>> getItens() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<Item> list = itensFromJson(response.body);
      return list;
    } else {
      return <Item>[];
    }
  }

  Future<String> updateItens(Item itens) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: itens.toJsonUpdate());
    if (response.statusCode == 200) {
      //print("Update Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }

  Future<String> deleteItens(Item itens) async {
    final response =
        await http.post(Uri.parse(DELETE_URL), body: itens.toJsonUpdate());
    if (response.statusCode == 200) {
     // print("Delete Response : " + response.body);
      return response.body;
    } else {
      return "ERROR";
    }
  }
}
