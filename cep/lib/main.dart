import 'package:cep/clima.dart';
import 'package:flutter/material.dart';

import 'cep.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Menu'),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_location_alt_outlined),
              title: Text('Consulta de CEP'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsultaCepApp()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text('Consulta de clima'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ]),
        ),
        //corpo da aplicação
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [Text('seja bem vindo ao app')],
          ),
        ),
      ),
    );
  }
}
