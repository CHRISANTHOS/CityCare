import 'package:incident/models/incidents.dart';

class IncidentViewModel{

  Incidents incidents;

  IncidentViewModel({required this.incidents});

  String get title{
    return incidents.title;
  }

  String get description{
    return incidents.description;
  }

}