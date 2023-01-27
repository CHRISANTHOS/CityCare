
import 'package:incident/models/incidents.dart';
import 'package:dio/dio.dart';

class Webservices{

  Future<void> saveIncident(Incidents incidents)async{
    final url = 'https://63d244c01780fd6ab9c09152.mockapi.io/city/City';

    await Dio().post(url, data: {'title': incidents.title, 'description': incidents.description});


  }

}