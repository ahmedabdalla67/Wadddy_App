import 'dart:convert';

import 'package:first_app/models/Waddy_app/Waddy_app_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel)async
  {
    var url = Uri.parse('http://localhost:8080/auth/login');
    var response = await http.post(url, body: loginRequestModel.toJson());

    if(response.statusCode == 200 )
      {
        return LoginResponseModel.fromJason(json.decode(response.body));
      }else {
      print(response.statusCode);
      throw Exception('failed to load data');
    }


  }
}