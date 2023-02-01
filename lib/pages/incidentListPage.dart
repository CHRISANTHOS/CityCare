import 'package:flutter/material.dart';
import 'package:incident/pages/incidentReportPage.dart';
import 'package:incident/viewModels/incidentListViewModel.dart';
import 'package:incident/widgets/incident_list.dart';
import 'package:provider/provider.dart';
import 'package:incident/viewModels/incidentReportViewModel.dart';

class IncidentListPage extends StatefulWidget {

  @override
  State<IncidentListPage> createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {

  Future<void> _navigateToReportPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) => IncidentReportViewModel(),
              child: IncidentReportPage()),
          fullscreenDialog: true),
    );
    _populateIncidents();
  }

  void _populateIncidents(){
    Provider.of<IncidentListViewModel>(context, listen: false).getAllIncidents();
  }

  Widget _updateUI(IncidentListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.loading :
        return const Align(child: CircularProgressIndicator(),);
      case LoadingStatus.empty :
        return const Align(child: Text('No incidents'),);
      case LoadingStatus.success :
        return IncidentList(incidents: vm.incidents);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _populateIncidents();
  }
  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<IncidentListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incidents'),
      ),
      body: Stack(
        children: [
          _updateUI(vm),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                    _navigateToReportPage(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
