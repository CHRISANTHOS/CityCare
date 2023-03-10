import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'pages/incidentListPage.dart';
import 'package:incident/viewModels/incidentListViewModel.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (BuildContext context) => IncidentListViewModel(),
          child: IncidentListPage()),
    );
  }
}

