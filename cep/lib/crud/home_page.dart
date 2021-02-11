import 'package:cep/crud/database_helper.dart';
import 'package:cep/crud/pessoa.dart';
import 'package:cep/crud/pessoa_detalhes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper db = DatabaseHelper();
  List<Pessoa> pessoas;
  @override
  void initState() {
    updateView();
  }

  updateView() {
    db.listar().then((listagemPessoaDoBanco) {
      print(listagemPessoaDoBanco);
      setState(() {
        this.pessoas = listagemPessoaDoBanco;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CrudPessoa'),
      ),
      body: ListView.builder(
          itemCount: this.pessoas?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(this.pessoas[index].nome),
                Text(this.pessoas[index].email),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Clique aqui para incluir um novo item',
        onPressed: () async {
          bool resp = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => PessoaDetalhes()));
          if (resp == true) {
            updateView();
          }
        },
      ),
    );
  }
}
