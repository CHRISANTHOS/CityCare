import 'package:flutter/material.dart';
import 'package:incident/services/webservice.dart';
import 'package:incident/viewModels/incidentViewModel.dart';

class IncidentListViewModel extends ChangeNotifier{

  List<IncidentViewModel> incidents = <IncidentViewModel>[];

  Future<void> getAllIncidents()async{
    final results =await Webservices().getAllIncident();
    incidents = results.map((incident) => IncidentViewModel(incidents: incident)).toList();
    notifyListeners();
  }



}