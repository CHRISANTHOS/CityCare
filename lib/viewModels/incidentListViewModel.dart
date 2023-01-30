import 'package:flutter/material.dart';
import 'package:incident/services/webservice.dart';
import 'package:incident/viewModels/incidentViewModel.dart';

enum LoadingStatus{
  loading,
  empty,
  success
}

class IncidentListViewModel extends ChangeNotifier{

  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<IncidentViewModel> incidents = <IncidentViewModel>[];

  Future<void> getAllIncidents()async{
    loadingStatus = LoadingStatus.loading;
    final results =await Webservices().getAllIncident();
    incidents = results.map((incident) => IncidentViewModel(incidents: incident)).toList();
    loadingStatus = incidents.isEmpty ? LoadingStatus.empty: LoadingStatus.success;
    notifyListeners();
  }



}