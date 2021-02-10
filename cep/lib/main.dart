import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

main() {
  runApp(ConsultaCepApp());
}

class ConsultaCepApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConsultaCepApp();
  }
}

class _ConsultaCepApp extends State<ConsultaCepApp> {
  var controllerText = TextEditingController();
  var cidade = "Teste";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consulta CEP'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Trabalho final PDM-SI2020.2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cloud),
                title: Text('Previsão do tempo'),
              ),
              ListTile(
                leading: Icon(Icons.add_location_alt_outlined),
                title: Text('Consulta de CEP'),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Crud'),
              ),
            ],
          ),
        ), //menu lateral
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: this.controllerText,
                decoration: InputDecoration(
                  labelText: 'Informe um CEP',
                ),
              ),
              RaisedButton(
                child: Text('buscar'),
                onPressed: () {
                  realizaConsulta();
                },
              ),
              Material(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        this.cidade,
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.home),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  realizaConsulta() async {
    String url = 'http://cep.republicavirtual.com.br/web_cep.php?cep=';
    url += this.controllerText.text;
    url += '&formato=jsonp';

    var resposta = await http.get(url);
    var json = jsonDecode(resposta.body);

    print(json['cidade']);

    setState(() {
      this.cidade = json['cidade'] + ' / ' + json['uf'];
    });

    print(this.cidade);
  }
}
