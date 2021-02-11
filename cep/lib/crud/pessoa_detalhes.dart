import 'package:cep/crud/database_helper.dart';
import 'package:cep/crud/pessoa.dart';

import 'package:flutter/material.dart';

class PessoaDetalhes extends StatefulWidget {
  @override
  _PessoaDetalhesState createState() => _PessoaDetalhesState();
}

class _PessoaDetalhesState extends State<PessoaDetalhes> {
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar/criar pessoa'),
      ),
      body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nomeCtrl,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    this.gravar();
                  }),
            ],
          )),
    );
  }

  void gravar() {
    Pessoa p = new Pessoa(null, nomeCtrl.text, emailCtrl.text);
    this.db.gravar(p).then((value) {
      //clicou no botao gravar retorna verdadeiro para atualizar a tela
      Navigator.of(context).pop(true);
    });
  }
}
