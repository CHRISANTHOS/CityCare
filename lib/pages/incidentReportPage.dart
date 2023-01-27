import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:incident/viewModels/incidentReportViewModel.dart';

class IncidentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<IncidentReportViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Report an incident'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) => vm.title = value,
              decoration: InputDecoration(
                  labelText: 'Enter title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              onChanged: (value) => vm.description = value,
              textInputAction: TextInputAction.done,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(labelText: 'Enter description'),
            ),
            TextButton(
              onPressed:(){
                vm.saveIncident();
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
            )
          ],
        ),
      ),
    );
  }
}
