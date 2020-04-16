import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future<dynamic> getData() async
  {
    var response = await get(this.url);
    if(response.statusCode>=200 && response.statusCode<=300 )
    {
      var responseData = jsonDecode(response.body);

      return responseData;

    }else
    {
      return "error";
    }


  }
}