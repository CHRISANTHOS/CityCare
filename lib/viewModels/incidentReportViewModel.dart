import 'package:incident/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:incident/models/incidents.dart';

class IncidentReportViewModel extends ChangeNotifier{

  String? title;
  String? description;
  String? imagePath;

  Future<void> saveIncident()async{
    final incident = Incidents(title: title!, description: description!);
    await Webservices().saveIncident(incident);
  }

}