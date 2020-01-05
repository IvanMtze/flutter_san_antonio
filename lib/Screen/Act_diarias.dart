import 'package:flutter/material.dart';

import 'Tabs/Agua.dart';
import 'Tabs/Alimento.dart';
import 'Tabs/Mortandad.dart';

class Act_diarias extends StatelessWidget {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          bottom: TabBar(
            tabs: [
              Tab(text: "MORTANDAD"),
              Tab(text: "AGUA"),
              Tab(text: "ALIMENTO"),
            ],
          ),
          title: Text('Actividades Diarias'),
        ),
        body: Center(
          child: TabBarView(
            children: [
              Mortandad(scaffoldKey: _scaffoldKey),
              Agua(scaffoldKey: _scaffoldKey),
              Alimento(scaffoldKey: _scaffoldKey),
            ],
          ),
        ),
      ),
    ));
  }
}
