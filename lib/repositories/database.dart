import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

INICIAR_DATABASE() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = documentsDirectory.path + "/dados.db";
  var database;
  return database = await openDatabase(
      path,
      version: 1,
      onUpgrade: (Database db, int version, int info) async {},
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE dados (" +
                "id integer primary key autoincrement, " +
                "tema integer)"
        );
      }
  );
}

INSERT_DATABASE(database, dados) async {
  await database.rawInsert(
      'INSERT into dados(tema)'+
          ' values(?)', [dados]
  );
}

READ_DATABASE(database) async {
  var lista = await database.query(
      "dados",
      columns: ["*"],
      where: "id=?",
      whereArgs: ["1"]
  );

  if(lista.toString().isNotEmpty){
    return lista;
  }else{
    return null;
  }

}


REMOVER_DATABASE(database) async {
  await database.rawDelete(
      "delete from dados");
}

FECHAR_DATABASE(database) async {
  await database.close();
}