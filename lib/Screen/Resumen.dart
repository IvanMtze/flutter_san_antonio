import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Screen//Act_diarias.dart';
import 'package:flutter_san_antonio/Screen/Configuracion.dart';
import 'package:flutter_san_antonio/Screen/Lotes.dart';
import 'package:flutter_san_antonio/Screen/Peso_promedio.dart';

import 'AlimentoConsumido.dart';

class Resumen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Drawer Demo';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

Widget Menu(context) {
  String profile =
      'https://i.pinimg.com/originals/68/99/33/6899333129699b097357a8398dcb908e.jpg';
  String portada =
      'http://pollosanantonio.com.mx/wp-content/uploads/2016/06/San-Antonio-Slide-111.png';

  return ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(
          accountName:
              Text('San Antonio', style: TextStyle(color: Colors.black)),
          accountEmail: Text('pollosanantonio.com.mx',
              style: TextStyle(color: Colors.black)),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(profile),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(portada)))),
      //No encuentro la razón por la que los íconos no se ven, aiudaaaa
      //ia se ve :v atte. Gerardito
      ListTile(
        title: Text('Resumen'),
        trailing: Icon(Icons.arrow_back),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => Resumen())),
      ),
      ListTile(
          title: Text('Actividades Diarias'),
          trailing: Icon(Icons.sentiment_satisfied),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Act_diarias()))),
      ListTile(
        title: Text('Peso promedio'),
        trailing: Icon(Icons.add),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Peso_promedio())),
      ),
      ListTile(
        title: Text('Alimento'),
        trailing: Icon(Icons.accessible_forward),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => AlimentoConsumido())),
      ),
      ListTile(
          title: Text('Lotes'),
          trailing: Icon(Icons.airline_seat_flat_angled),
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Lotes()))),
      Divider(),
      ListTile(
          title: Text('Configuración'),
          trailing: Icon(Icons.airline_seat_flat_angled),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Configuracion()))),
      ListTile(
        title: Text('Cerar sesión'),
        trailing: Icon(Icons.volume_off),
      ),
    ],
  );
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Text('Aqui estarian unas graficas bien chidas '
                'si tuviera unas!!!')),
        drawer: Drawer(child: Menu(context)));
  }
}
