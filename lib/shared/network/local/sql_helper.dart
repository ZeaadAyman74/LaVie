import 'package:orange/models/carts_model.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {

 static late Database db;
static Future init(String path)async{
   db=await openDatabase(path,version: 1,
     onCreate: (Database db,version)async{
    await db.execute(
      'CREATE TABLE carts(id INTEGER PRIMARY KEY,name TEXT,price INTEGER,image TEXT,type TEXT,productId TEXT,quantity INT)'
    );
     }
  );

}

 static Future insertCart(CartsModel cart) async {
    await db.insert('carts', cart.toMap());
 }

static Future<List<Map>?> getCarts() async {
   List<Map> maps = await db.query('carts',
       columns: ['name', 'image', 'type','price','productId','quantity'],);
   if (maps.isNotEmpty) {
     return maps;
   }
   return null;
 }

 static Future<List<Map>?> getCartItem(String id) async {
   List<Map> maps = await db.query('carts',
       columns: ['name', 'image', 'type','price','productId','quantity'],
       where: 'productId = ?',
       whereArgs: [id]);
   if (maps.length > 0) {
     return maps;
   }
   return null;
 }

 static Future<int> delete(String id) async {
   return await db.delete('carts', where: 'productId = ?', whereArgs: [id]);
 }

static Future<int> update(String id,int quantity) async {
   return await db.update('carts',{'quantity': quantity},
       where: 'productId = ?', whereArgs: [id]);
 }


}





// void createDatabase() async {
//   await openDatabase('Todo.db', version: 1, onCreate: (database, version) {
//     //id integer
//     //title string
//     //date string
//     //time string
//     //status string
//
//     print("Database created");
//     database.execute(
//         'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
//         .then((value) {
//       print("Table created");
//     }).catchError((error) {
//       print("Error when creating table ${error.toString()}");
//     });
//   }, onOpen: (database) {
//     getDataFromDatabase(database);
//     print("database opened");
//   }).then((value) {
//     database = value;
//     print("Created");
//     emit(AppCreateDatabaseState());
//   });
// }
//
// insertToDatabase({
//   required String title,
//   required String time,
//   required String date,
// }) async {
//   await database!.transaction((txn) async {
//     txn.rawInsert(
//         'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new")').then((value) {
//       titleController.text='';
//       timeController.text='';
//       dateController.text='';
//       print("$value inserted successfully");
//       emit(AppInsertDatabaseState());
//       getDataFromDatabase(database);
//     }).catchError((error) {
//       print("Error when inserting new record ${error.toString()}");
//     });
//   });
// }
//
// void getDataFromDatabase(database) {
//   newTasks = [];
//   doneTasks = [];
//   archiveTasks = [];
//
//   database!.rawQuery('SELECT * FROM tasks').then((value) {
//     value.forEach((element) {
//       if (element['status'] == 'new') {
//         newTasks.add(element);
//       } else if (element['status'] == 'done') {
//         doneTasks.add(element);
//       } else {
//         archiveTasks.add(element);
//       }
//     });
//     emit(AppGetDatabaseState());
//   });
// }
//
// void updateData({
//   required String status,
//   required int id,
// }) async {
//   database.rawUpdate(
//       'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
//     getDataFromDatabase(database);
//     emit(AppUpdateDataState());
//   }).catchError((error) {
//     print("Errooooooooor $error");
//   });
// }
//
// void deleteData({
//   required int id,
// }) async {
//   database.rawDelete(
//       'DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//     getDataFromDatabase(database);
//     emit(AppDeleteDataState());
//   }).catchError((error) {
//     print("Errooooooooor $error");
//   });
// }
