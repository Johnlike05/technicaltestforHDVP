import 'dart:convert';
import 'dart:io';
import 'package:technicaltestform/src/models/user_model.dart';
import 'package:http/http.dart' as http;


class UserProvider{

final String _url = 'https://vast-shelf-26875.herokuapp.com/api';

//funcion para traer usarios de la BD
  Future<List<UserModel>> loadUsers() async{
    
    final url = 'https://vast-shelf-26875.herokuapp.com/api/users';
    final resp = await http.get(url);
    
    final  decodedData = json.decode(resp.body);
   
    List datos = decodedData;

    
    final List<UserModel> users = [];
    
    //asociar datos al modelo
    if( datos == null ) return null;
    datos.forEach(( user ){
     final eventsTemp = UserModel.fromJson(user);
      users.add(eventsTemp);
    });
    
    return users;
  }

  //funcion crear usuario BD
  Future<bool> crearUser( UserModel user, List address) async{

      //armar direcciones para json
      List data2 = [];
    address.forEach((element) {
      data2.add(
      {
        "address":element
      }
      );
    }
    );
    //armar json
    final data = {
      "name":user.name,
      "last_name":user.lastName,
      "birth_date":user.birthDate,
      "address":data2,
    };
    
    final body = jsonEncode(data);
    final url = '$_url/users';    
    print(body);
    final resp = await http.post(url, body:body, headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    final decodeData = json.decode(resp.body);

    return true;
  }
  


  

}