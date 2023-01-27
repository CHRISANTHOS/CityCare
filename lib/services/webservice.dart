
import 'package:incident/models/incidents.dart';
import 'package:dio/dio.dart';

class Webservices{

  Future<void> saveIncident(Incidents incidents)async{
    final url = 'https://63d244c01780fd6ab9c09152.mockapi.io/city/City';

    await Dio().post(url, data: {'title': incidents.title, 'description': incidents.description});
  }

  Future<List<Incidents>> getAllIncident()async{

    final url = 'https://63d244c01780fd6ab9c09152.mockapi.io/city/City';

    Response response = await Dio().get(url);
    if(response.statusCode == 200){
      final Iterable json = response.data;
      return json.map((incident) => Incidents.fromJson(incident)).toList();
    }else{
      throw Exception('Can\'t get incidents');
    }

  }

}