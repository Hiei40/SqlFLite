import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{
 static Database? _db;
 Future<Database?> get db async{
if(_db==Null){
 _db=await intialDb();
return _db;}
else{

 return _db;
}
}

 intialDb()async{
 String databasepath =await getDatabasesPath();
 String path = join(databasepath, 'Wael.db');
 Database mydb = await openDatabase(path, version: 3,onCreate:_onCreate,OnUpgrade:_OnUpgrade);
return mydb;
 }
 _OnUpgrade(Database db, int oldversion,int newversion){


 }
_onCreate(Database db, int version) async {
 // When creating the db, create the table
 await db.execute('''
     'CREATE TABLE "notes" (id AUTOINCREMENT NOT NULL PRIMARY KEY,notes TEXT NOT NULL )
     ''');
 print("create DATABASE AND TABLE");
}
//Read Data
readData(String sql)async{
 Database? mydb= await db;
 List<Map> responde =await mydb!.rawQuery(sql) ;
return responde;
}
//Insert Data
 insertData(String sql)async{
  Database? mydb= await db;
  int responde =await mydb!.rawInsert(sql);
  return responde;
 }
 //Update data
 upData(String sql)async{
  Database? mydb= await db;
  int responde =await mydb!.rawUpdate(sql);
 return  responde;
 }
 // delete data
 deleteData(String sql)async{
  Database? mydb= await db;
  int responde =await mydb!.rawDelete(sql);
  return  responde;
 }

}
