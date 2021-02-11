import 'package:cep/crud/pessoa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String CREATE_TABLE =
      'create table pessoa(idPessoa integer primary key auto_increment not null,' +
          'nome text not null, email text)';
  //nome da tabela
  String tabela = 'pessoa';
  Future<Database> abrirConexao() async {
    return openDatabase(
      join(await getDatabasesPath(), 'banco_pessoa.db'),
      onCreate: (db, version) {
        return db.execute(
          this.CREATE_TABLE,
        );
      },
      version: 1,
    );
  }

  Future gravar(Pessoa p) async {
    Database db = await this.abrirConexao();
    if (p.idPessoa == null) {
      return db.insert(this.tabela, p.toMap());
    } else {
      return db.update(
        this.tabela,
        p.toMap(),
        where: 'idPessoa = ?',
        whereArgs: [p.idPessoa],
      );
    }
  }

  Future remover(Pessoa p) async {
    Database db = await this.abrirConexao();
    return db.delete(
      this.tabela,
      where: 'idPessoa = ?',
      whereArgs: [p.idPessoa],
    );
  }

  Future<List<Pessoa>> listar() async {
    Database db = await this.abrirConexao();
    List<Map<String, dynamic>> pessoas = await db.query(this.tabela);
    //converte para a lista de pessoas , pq o retorno é feito em um map
    return List.generate(
        pessoas.length, (index) => Pessoa.fromMap(pessoas[index]));
  }
}
