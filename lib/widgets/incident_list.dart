import 'package:flutter/material.dart';
import 'package:incident/viewModels/incidentViewModel.dart';

class IncidentList extends StatelessWidget {

  final List<IncidentViewModel> incidents;
  IncidentList({required this.incidents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: incidents.length,
        itemBuilder: (context, index){
        return ListTile(
          title: Text(incidents[index].title),
        );
        }
    );
  }
}
