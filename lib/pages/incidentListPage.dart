import 'package:flutter/material.dart';
import 'package:incident/pages/incidentReportPage.dart';
import 'package:incident/widgets/incident_list.dart';

class IncidentListPage extends StatelessWidget {

  Future<void> _navigateToReportPage(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => IncidentReportPage(),
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incidents'),
      ),
      body: Stack(
        children: [
          IncidentList(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                    _navigateToReportPage(context);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
